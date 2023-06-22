# Maintainer: John Patrick <john.patrick@gmail.com>
pkgname=sofirem-git
_pkgname=sofirem
_destname1="/usr"
pkgver=r54.ea473ba
pkgrel=1
pkgdesc="Software Installer Remover for Arch Linux based distros"
arch=('x86_64')
url="https://github.com/arcolinux/${_pkgname}"
license=('GPL3')
depends=('python-psutil' 'python-requests' 'python-distro')
makedepends=('git')
options=(!strip !emptydirs)
conflicts=('sofirem-dev-git')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
install='readme.install'
pkgver() {
    cd "${srcdir}/sofirem"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	sed -i -e s/pkgversion/$pkgver/ $srcdir/${_pkgname}/usr/share/sofirem/sofirem.py
	sed -i -e s/pkgrelease/$pkgrel/ $srcdir/${_pkgname}/usr/share/sofirem/sofirem.py
	sed -i -e s/pkgversion/$pkgver/ $srcdir/${_pkgname}/usr/share/sofirem/ui/AboutDialog.py
	sed -i -e s/pkgrelease/$pkgrel/ $srcdir/${_pkgname}/usr/share/sofirem/ui/AboutDialog.py
	cp -r ${srcdir}/${_pkgname}/${_destname1} ${pkgdir}
}
