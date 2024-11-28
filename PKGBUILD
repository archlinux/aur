# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=tkdnd2-git
pkgver=r46.9a55907
pkgrel=3
pkgdesc="About Tkinter native drag and drop support."
arch=('x86_64')
url="https://github.com/Eliav2/tkinterdnd2"
license=('MIT')
conflicts=('tkdnd2')
depends=('tk')
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/Eliav2/tkinterdnd2.git")
md5sums=('SKIP')

pkgver() {
  cd tkinterdnd2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd tkinterdnd2
  pytest -v --cov || true
}

package() {
  cd tkinterdnd2
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1  
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
