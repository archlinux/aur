# Maintainer: Virt <virtinstance@gmail.com>

pkgname=jemula802-git
pkgver=r223.4086c28
pkgrel=1
pkgdesc='Emulation software to model 802.11 and other 802 wireless communication systems.'
arch=(any)

url='https://bitbucket.org/lfield/jemula802'
license=(BSD)

depends=('java-runtime')
makedepends=('ant' 'java-environment')

source=("git+https://bitbucket.org/lfield/jemula802.git"
        "git+https://bitbucket.org/lfield/jemula.git"
        "ant-jar.patch"
        "jemula802.sh")

sha256sums=('SKIP'
            'SKIP'
            'f8ccc41d5c6b01d84ebc8dd4fe966ea1b9d7eed59f44ab06b197264dce66db0b'
            'bcebdb3dff9e0ba1e8b758ccd7f3d213042047b24b14a200c673c0b5974f8fba')

pkgver() {
	cd "$srcdir"/jemula802
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"/jemula802

	git apply < "$srcdir/ant-jar.patch"
	
	ant -Djemula="$srcdir/jemula"
}

package() {
	cd "$srcdir"/jemula802

	install -Dm644 dist/jemula802.jar "$pkgdir"/usr/share/java/jemula802/jemula802.jar
	install -Dm755 ../jemula802.sh "$pkgdir"/usr/bin/jemula802
}
