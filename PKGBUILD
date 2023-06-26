# Maintainer: Nima Fanniasl <nma.fanniasl@gmail.com>

pkgname=araste-git
pkgver=3.2
pkgrel=2
pkgdesc="Making ascii-art out of Persian/Arabic text"
arch=('any')
url="https://github.com/ekm507/araste/"
license=('AGPLv3')
depends=("python" "python-setuptools" "python-pip" "python-installer" "python-build" "python-wheel")
makedepends=("git")
source=("araste-git::git+https://github.com/ekm507/araste.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --tags main | cut -d- -f1 | sed 's/v//g'
}

prepare() {
cat <<'EOF'
                                        ██████
          ████                ██        ██
    ████                      ██          ██
    ████    ██    ██  ██  ██  ██    ██    ██
      ██████████████████████  ██    ██    ██
                                    ██
                                  ██
EOF
}

build() {
	cd "${srcdir}/${pkgname}"
	python -m build --wheel --no-isolation
}
package() {
	cd "${srcdir}/${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
