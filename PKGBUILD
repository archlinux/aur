# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Felipe F. Tonello <eu@felipetonello.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# TODO: support Toast

pkgbase=bitbake
pkgname=('bitbake' 'bitbake-vim')
pkgver=1.34
pkgrel=1
pkgdesc='Build tool executing tasks and managing metadata.'
arch=('any')
url='https://www.openembedded.org/wiki/Main_Page'
license=('GPL2')
makedepends=('git' 'python' 'python-django18' 'python-beautifulsoup4' 'python-codegen' 'python-pyinotify' 'python-progressbar')
source=('git://git.openembedded.org/bitbake#commit=b4da94a')
md5sums=('SKIP')

check() {
    cd ${pkgbase}/bin
    PYTHONPATH="${srcdir}/${pkgbase}/lib:${srcdir}/${pkgbase}/lib/bb" python ./bitbake-selftest
}

package_bitbake() {
    depends=('python' 'python-django18' 'python-beautifulsoup4' 'python-codegen' 'python-pyinotify' 'python-progressbar')
    install=bitbake.install

    cd ${pkgbase}

    install -d "${pkgdir}/usr/bin"
    install bin/bitbake* "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/lib/python3.6/site-packages"
    cp -Ra lib/bb "${pkgdir}/usr/lib/python3.6/site-packages"
    cp -Ra lib/prserv "${pkgdir}/usr/lib/python3.6/site-packages"

    install -d "${pkgdir}/usr/share/man/man1"
    install doc/bitbake.1 "${pkgdir}/usr/share/man/man1"
}

package_bitbake-vim() {
    cd ${pkgbase}

    install -d "${pkgdir}/usr/share"
    cp -Ra contrib/vim "${pkgdir}/usr/share"
}
