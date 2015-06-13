# Maintainer: Christian Bühler <christian@cbuehler.de>

pkgname=smtpclient-qt5-git
pkgver=r76.781fd40
pkgrel=1
pkgdesc="An SMTP Client writen in C++ for Qt."
arch=('i686' 'x86_64')
url="https://github.com/bluetiger9/SmtpClient-for-Qt"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
source=('smtpclient::git+https://github.com/bluetiger9/SmtpClient-for-Qt.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/smtpclient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|app|lib|g' -i "${srcdir}/smtpclient/SMTPEmail.pro"
}

build() {
  cd "${srcdir}/smtpclient/src"
  qmake-qt5 ..
  make
}

package() {
  cd "${srcdir}/smtpclient/src"
  mkdir -p "${pkgdir}/usr/"{include,lib}
  cp *.h SmtpMime "${pkgdir}/usr/include"
  cp libSMTPEmail.so.1.0.0 "${pkgdir}/usr/lib"
  cd "${pkgdir}/usr/lib"
  ln -s libSMTPEmail.so.1.0.0 libSMTPEmail.so
  ln -s libSMTPEmail.so.1.0.0 libSMTPEmail.so.1
  ln -s libSMTPEmail.so.1.0.0 libSMTPEmail.so.1.0
}
