# Maintainer: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.43.5
pkgrel=1
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)
source=(nextdns.service)
source_x86_64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz)
source_i686=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_386.tar.gz)
source_aarch64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_arm64.tar.gz)
source_armv7h=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_armv7.tar.gz)
sha256sums=('00b0c930275df825475b0d86062f7488131f1b2b5e16e5ec6f9983e53138505b')
sha256sums_x86_64=('e25594aff185358e2e22c339817c3ab2232bbe755644a861eda199989c349c69')
sha256sums_i686=('c9cd53d0455c0bc5f2a6257528a7ecd4fe5ce3836a3c487ca6ac9db4a7bf9ede')
sha256sums_aarch64=('09ee20af9dce10837f52ce7bf8f237461344efb1155023bafb4b6952b269afa5')
sha256sums_armv7h=('cae59240affbba7a0c7e003d45d1321ccc0209306fbeb7bae8c83c5a0dace92b')
b2sums=('cf97472882f3db8e4debbe9aaefd8fddb2c78b1221045b556b486e5adb2448c28ce8c9e49bf54e85858a25760bf6d981c55117975b94039ac48cd24e87e12ec6')
b2sums_x86_64=('3dbf7473626689a95ff154a5e12117a7c382921faa95007c4146d0da901ec054505455590a45a1fa27d528fe5d0158793f48d1c2984de65d2a5d85d4654f3d57')
b2sums_i686=('2755b12a75cbc3518c73756e6eb13afa00477648019fc7f4b68bcdf5c5f0807c8a53f0925b02d082d0c6ee16e6ddd039ed6430e08febf9e58ed7f814a3cdbee6')
b2sums_aarch64=('f9170f540b7a461f9720b02d5ba3d87fa0164ad8eb4b7fa474c6ad3532d0a709745b3968af6b9171c0752f01325b8d5bd5b5c5ba7679605875644fec3088fef5')
b2sums_armv7h=('6c81e66ad0d4d60e23fc5a8530ccbb016d53ff089bc0dc9df88836ec3e721bb290ee12e13c427da07cb91109e037fe55a600c6c581eec9d5a9145e804a85f013')

build() {
  cd $srcdir
  # post-install:
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - NB: setup-router overrides listen
  ./nextdns config list | sort > nextdns.conf
}

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
