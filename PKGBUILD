# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-customtkinter-git
pkgver=r583.10f34d2
pkgrel=1
pkgdesc="Python bindings for the FMOD Ex sound library"
arch=('x86_64')
url="A modern and customizable python UI-library based on Tkinter."
license=('MIT')
depends=('python'
         'tk'
         'python-darkdetect'
         'python-typing_extensions'
         'python-packaging')
provides=('python-customtkinter')
conflicts=('python-customtkinter')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+https://github.com/TomSchimansky/CustomTkinter.git")
md5sums=('SKIP')

pkgver() {
  cd CustomTkinter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd CustomTkinter
  python -m build --wheel --no-isolation
}

package() {
  cd CustomTkinter
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 Readme.md "${pkgdir}/usr/share/doc/${pkgname}/README" 
}
