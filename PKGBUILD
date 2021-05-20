# Maintainer: Gareth Dunstone <gareth.dunstone at anu dot edu dot au>

pkgname=kapacitor-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/kapacitor"
license=('MIT')
depends=()
conflicts=('kapacitor' 'tickfmt')
backup=('etc/kapacitor/kapacitor.conf')
install=kapacitor.install

source_i686=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_i386.tar.gz")
sha256sums_i686=('1f8178f197c839c8d5da296cd93a927176e1f6934696866815e97ac46818fa31')
source_x86_64=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('f9cbbed21d7e43a19be44df7e1f84ce90625dc825670297ba4785fb3fee2355d')
source_armv6h=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv6h=('94dbb589527daafe8239d1c9bdf9a134e05aa44a235e19199f395828d0377a2e')
source_armv7h=(kapacitor.tar.gz::"https://dl.influxdata.com/kapacitor/releases/kapacitor-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv7h=('94dbb589527daafe8239d1c9bdf9a134e05aa44a235e19199f395828d0377a2e')
source=('kapacitor.sysusers' 'kapacitor.tmpfiles' 'LICENSE')
sha256sums=('94aa16ca0b89b1773abb2333d03233921effccc9461ca1491eba42688a1505bd'
'ae8da72ee9e077e60f897b2e3920add44b0c4853a6c1bb6cf70767d6caeb4763'
'bece49bfc61abbb9d0b69bebb47955a44617ada83186c95db5651cd40c0a867a')

package() {
  cd $srcdir/kapacitor-$pkgver-$pkgrel
  install -Dm644 ../kapacitor.sysusers "$pkgdir/usr/lib/sysusers.d/kapacitor.conf"
  install -Dm644 ../kapacitor.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kapacitor.conf"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/kapacitor-bin/LICENSE"

  install -Dm755 usr/bin/kapacitord "$pkgdir/usr/bin/kapacitord"
  install -Dm755 usr/bin/kapacitor "$pkgdir/usr/bin/kapacitor"
  install -Dm644 usr/lib/kapacitor/scripts/kapacitor.service "$pkgdir/usr/lib/systemd/system/kapacitor.service"
  install -Dm644 etc/kapacitor/kapacitor.conf "$pkgdir/etc/kapacitor/kapacitor.conf"
  install -Dm644 etc/logrotate.d/kapacitor "$pkgdir/etc/logrotate.d/kapacitor"
}
