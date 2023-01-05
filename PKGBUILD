# Maintainer: tristero <crf8472@web.de>

pkgname=libarcstk-git
pkgver=r593.601af78
pkgrel=1
pkgdesc='Toolkit to calculate and verify AccurateRip checksums and ids'
arch=('x86_64')
url="https://codeberg.org/tristero/${pkgname%-git}"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('gcc-libs')
makedepends=('git>=2.0' 'cmake>=3.9.6')
optdepends=('doxygen>=1.8.14: build documentation'
            'python-virtualenv: build HTML documentation with m.css')
source=("${pkgname%-git}::git+https://codeberg.org/tristero/${pkgname%-git}.git#branch=main")
md5sums=('SKIP')


pkgver()
{
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


## No prepare() function


build()
{
    msg "Configure"

	cmake -DCMAKE_BUILD_TYPE=Release    \
		  -DCMAKE_INSTALL_PREFIX="/usr" \
		  "${srcdir}/${pkgname%-git}/"

    msg "Build"

    cmake --build .
}


package()
{
	msg "Install library and files"

    make DESTDIR="${pkgdir}/" install


	msg "Install license"

	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

