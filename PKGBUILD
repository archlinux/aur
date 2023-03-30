# Maintainer: Bandie <bandie@chaospott.de>

pkgname=pam_panic
pkgver=0.3.5
pkgrel=3
pkgdesc="A PAM module that protects sensitive data and provides a panic function for emergency situations. Authentication through passwords or removable media."
arch=('any')
url="https://github.com/pampanic/pam_panic"
license=('GPL3')
depends=('cryptsetup' 'dialog' 'gettext')
makedepends=('git' 'automake' 'autoconf' 'make' 'gcc' 'which' 'groff' 'gettext' 'm4' 'fakeroot' 'gawk' 'pam' 'cryptsetup' 'dialog' 'po4a')
checkdepends=('cunit')
validpgpkeys=('A96C47F1DAF30E876A178F86F130CE870C45ED7C')
source=(
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/pampanic/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc"
)
sha512sums=(
  '3552cfc92c38eaedcda4fe436915128447c718f4e4ceefeff0427ab9860ce2925b8795e8ca74c5d77ded4b897dc20bab3a7b63f8dcaafac3bb979760a374007c'
  'ef3c64fd2a6d5eed6a1b84e0725152a386d0a4385e4ed5fc5f52b600463e7446e7e4a2f797084db997a4b9c035c13037140f6ae68b3973199bc94ba690b5d74a'
)

build() {
  cd $pkgname-$pkgver
  autoreconf -i
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make test
  make clean
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

