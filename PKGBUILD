# Mantainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Felipe F. Tonello <eu@felipetonello.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=bitbake
pkgname=(bitbake bitbake-vim)
pkgver=6.0
pkgrel=4
pkgdesc="Build tool executing tasks and managing metadata"
url="https://www.openembedded.org/wiki/Main_Page"
license=(GPL-2.0-only)
arch=(any)
depends=(python python-beautifulsoup4 python-ply python-codegen
  python-progressbar python-pyinotify python-simplediff chrpath diffstat inetutils rpcsvc-proto)
makedepends=(git)
source=("git+https://git.openembedded.org/bitbake.git#tag=yocto-$pkgver")
sha256sums=('7db5c6e3ffe711e6c0cb2659509254579c2ed280d9cdcb734b3947e806a0f11a')

package_bitbake() {
    install=bitbake.install

    local _site_packages="${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"
   
    cd "${pkgbase}"

    find . -iname "*.log" -delete
    install -d "${pkgdir}/usr/bin"
    install bin/* "${pkgdir}/usr/bin"

    install -d "${_site_packages}"
    cp -Ra lib/* "${_site_packages}"

    rm -rvf "${_site_packages}/"{bs4,ply,progressbar,pyinotify.py,simplediff,codegen.py}

    # cp -Ra lib/prserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    # cp -Ra lib/hashserv "${pkgdir}/usr/lib/python${_pythonver}/site-packages"
    # cp -Ra lib/bb/pysh "${pkgdir}/usr/lib/python${_pythonver}/site-packages"

    install -D doc/bitbake.1 -t "${pkgdir}/usr/share/man/man1"
}

package_bitbake-vim() {
  depends=()
    cd "${pkgbase}"

    install -d "${pkgdir}/usr/share"
    cp -Ra contrib/vim "${pkgdir}/usr/share"
}
