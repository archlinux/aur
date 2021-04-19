# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander-git
pkgver=r64.3e89a5f
pkgrel=1
pkgdesc="Simple but convenient CLI-based Matrix client app for sending and receiving"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL')
depends=( "python-aiohttp"
					"python-aiofiles"
					"python-argparse"
					"python-markdown"
					"python-matrix-nio"
					"python-notify2"
					"python-pillow"
					"python-magic-git")
provides=("matrix-commander")
conflicts=("matrix-commander")
source=("${pkgname%-git}::git+https://github.com/8go/matrix-commander.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	local _site_packages
	_site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
	install -d "${pkgdir}${_site_packages}/${pkgname%-git}/bin/"
	cd "${pkgname%-git}" || exit 1
	install -D -m 755 "./matrix-commander.py" "${pkgdir}/${_site_packages}/${pkgname%-git}/bin/"
	install -d "$pkgdir/usr/bin/"
	cd "$pkgdir/usr/bin/" || exit 1
	ln -s "${_site_packages}/${pkgname%-git}/bin/matrix-commander.py" "matrix-commander"
}
