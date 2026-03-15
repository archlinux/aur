# Mantainer: tiziodcaio <d dot bass05 at pm dot me>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Felipe F. Tonello <eu@felipetonello.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=bitbake
pkgname=(bitbake bitbake-vim)
pkgver=5.3.2
pkgrel=3
pkgdesc="Build tool executing tasks and managing metadata"
url="https://www.openembedded.org/wiki/Main_Page"
license=(GPL2)
arch=(any)
depends=(python python-beautifulsoup4 python-ply python-codegen
         python-progressbar python-pyinotify python-simplediff chrpath diffstat inetutils rpcsvc-proto)
source=("https://git.openembedded.org/bitbake/snapshot/bitbake-yocto-${pkgver}.tar.gz")
sha256sums=('e9a2360f1a2e08f06966425ed2e6dd574211e5c4e81311b2c0b34130fa5af8da')

package_bitbake() {
    install=bitbake.install

    local _site_packages="${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"
   
    cd "${pkgbase}-yocto-${pkgver}"

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
    cd "${pkgbase}-yocto-${pkgver}"

    install -d "${pkgdir}/usr/share"
    cp -Ra contrib/vim "${pkgdir}/usr/share"
}
