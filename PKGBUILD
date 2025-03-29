# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: LinRs <20455421+LinRs AT users.noreply.github.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Mike Douglas <code_monkey@gooeylinux.org>

pkgname="gtypist"
pkgver=2.10.1
pkgrel=1
pkgdesc="Universal typing tutor"
arch=('x86_64')
url="https://www.gnu.org/software/gtypist/gtypist.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses' 'perl')
makedepends=('help2man')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://ftp.gnu.org/gnu/${pkgname}/${_pkgsrc}.tar.gz"
        # "${_pkgsrc}.tar.gz.sig::https://ftp.gnu.org/gnu/${pkgname}/${_pkgsrc}.tar.gz.sig"
        "${pkgname}_ncurses_is_ncursesw.patch")
sha256sums=('09fdea05597b9c44e28dd795b8c9eb79a6afe4d02fef19ea6eb9956bc0813413'
            '9de7d6ef0bafc559a50011ca1ad4f66d43e955016f03475488b09e9dd7b08740')
# validpgpkeys=('F8F09C0B79F90A20F953FB1CA6D813D8C94AFA52'  # Tim Marston <edam@waxworlds.org>
#               '02AEC665007301C280C5C43A0FB807D2E7C7C96C') # 

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_ncurses_is_ncursesw.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --prefix='/usr'
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make prefix="${pkgdir}/usr" install

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "QUESTIONS" "${pkgdir}/usr/share/doc/${pkgname}/QUESTIONS"
  install -vDm644 "THANKS"    "${pkgdir}/usr/share/doc/${pkgname}/THANKS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
