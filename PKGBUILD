# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Old-Mantainer: Gonzalo Seguel <gonzaloseguel@gmail.com>

pkgname=kfilebox
pkgver=0.4.10
pkgrel=1
pkgdesc="KDE4 Dropbox client (with own daemon)"
arch=('i686' 'x86_64')
url="https://github.com/gtgt/kfilebox"
license=('GPL')
depends=('gettext')
provides=('dropbox')
source=(https://github.com/gtgt/kfilebox/archive/${pkgver}.tar.gz)
install=$pkgname.install
noextract=(${pkgname}-${pkgver}.tar.gz})
md5sums=('79d58aab7a342851cd961a0f784caefd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt4
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # install binary
    install -m 755 -p -D "bin/kfilebox" "${pkgdir}/usr/bin/kfilebox"
    # create data directory
    install -m 755 -d "${pkgdir}/usr/share/kfilebox"
    # install notifyrc file
    install -m 644 -p -D "kfilebox.notifyrc" "${pkgdir}/usr/share/apps/kfilebox/kfilebox.notifyrc"
    # install desktop file
    install -m 644 -p -D "kfilebox.desktop" "${pkgdir}/usr/share/applications/kde4/kfilebox.desktop"
    # install locales
    for language in `ls "locale"`
    do
      if [ -e locale/$language/kfilebox.mo ]; then
		install -m 644 -p -D locale/$language/kfilebox.mo ${pkgdir}/usr/share/locale/$language/LC_MESSAGES/kfilebox.mo
      fi
    done
}
