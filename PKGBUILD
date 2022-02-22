# Maintainer: Shapiro <shapiro@quantentunnel.de>

pkgname='veracrypt-inyourlanguage'
_pkgname='veracrypt'
pkgver=1.25.9
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
sha512sums=('9b11c8d8e85770ae05960fef8fc9639731e4f9caf0cc4e50bc8c9c92b45d44c80eaeff483d3ab048fd6a82cc873a6027820e21abde7ddb92b3c368f85b837cf2'
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

