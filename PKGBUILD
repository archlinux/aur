# Maintainer: Shapiro <shapiro@quantentunnel.de>

pkgname='veracrypt-inyourlanguage'
_pkgname='veracrypt'
pkgver=1.25.7
pkgrel=1
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Choose one of 40+ languages for installation.'
url='https://www.veracrypt.fr'
arch=('x86_64')
license=('Apache 2.0' 'TrueCrypt 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-git-no-gost' 'veracrypt-trans')
depends=('fuse2>=2.8.0' 'wxgtk3>=3.0' 'libsm' 'device-mapper')
makedepends=('git' 'yasm' 'libxml2' 'coreutils')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
source=("https://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/VeraCrypt_${pkgver}_Source.tar.bz2"
        "select_lang.sh")
sha512sums=('824a3cfa3a3fb702f92522a23ae33b1033f56f3224e4666c7b0dd6c1a4a5841c7ba148c8cd9a7fa900b0a6dda2febc65acbb57ee77a04666b7a2867a1063f981'
            'SKIP')

prepare() {
  bash $srcdir/../select_lang.sh
}

build() {
  cd src
  make
}

package() {
  cd src
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/sbin"
  rm -r "$pkgdir/usr/share/veracrypt"
}

