# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

# Python version
# Use 'python' for python3 or 'python2' for python2.
_python=python

_gitroot="https://github.com/Diaoul/subliminal"
_gitname="subliminal"
pkgname=('subliminal-git' 'nautilus-subliminal-git')
pkgver=1.0.2.r733.769b16d
pkgrel=1
epoch=2
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
makedepends=('git' "${_python}-setuptools" 'gettext')
depends=(
  "${_python}-beautifulsoup4>=4.2.0" "${_python}-guessit>=0.9.1"
  "${_python}-requests>=2.0" "${_python}-enzyme>=0.4.1"
  "${_python}-dogpile.cache>=0.5.4" "${_python}-click>=4.0"
  "${_python}-pysrt>=1.0.1" "${_python}-six>=1.9.0"
  "${_python}-babelfish>=0.5.2"
  "${_python}-chardet>=2.3.0" "${_python}-stevedore>=1.0.0"
)
conflicts=('subliminal' 'python-subliminal-git')
provides=('subliminal' 'python-subliminal-git')
source=("${_gitname}::git+${_gitroot}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "1.0.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_subliminal-git() {
  cd ${srcdir}/${_gitname}
  ${_python} setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/licenses/subliminal-git"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/subliminal-git/"
}

package_nautilus-subliminal-git() {
  pkgdesc="An extension for Nautilus to download subtitles."
  depends=('subliminal-git' "${_python}-nautilus")

  cd ${srcdir}/${_gitname}/examples
  install -v -m755 -d "${pkgdir}/usr/share/nautilus-python/extensions/subliminal/ui"
  install -v -m644 ./nautilus.py "${pkgdir}/usr/share/nautilus-python/extensions/subliminal-nautilus.py"
  install -v -m644 ./ui/{choose,config}.glade "${pkgdir}/usr/share/nautilus-python/extensions/subliminal/ui/"
  install -v -m755 -d "${pkgdir}/usr/share/locale/fr/LC_MESSAGES"
  msgfmt ./i18n/fr.po -o "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/subliminal.mo"
  install -v -m755 -d "${pkgdir}/usr/share/licenses/nautilus-subliminal-git"
  install -v -m644 ../LICENSE "${pkgdir}/usr/share/licenses/nautilus-subliminal-git/"
}
