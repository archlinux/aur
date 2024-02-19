# Maintainer: zhs <zhao4she4@tuta.io>                                                                                                                                                               
# by and large a copy of the stable version one by sikmir@gmail.con with a few
# small modifications

pkgname=pyglossary-git
_pkgname=pyglossary
pkgver=4.5.0.r2732.g8f7d7cfd
pkgrel=1
pkgdesc="A tool for converting dictionary files aka glossaries with various formats for different dictionary applications, git version"
arch=(any)
url="https://github.com/ilius/pyglossary"
license=('GPL3')
# TODO add python-libzim if/when it exists
depends=('python>=3.7.0')
optdepends=(
  'python-gobject: Gtk3-based interface'
  'tix: Tkinter-based interface'
  'python-prompt_toolkit: interactive command-line interface'
  'python-lxml: Many optional flags and formats'
  'python-beautifulsoup4: HTML parsing'
  'python-yaml: Reading from cc-kedict'
  'python-pyicu: Reading or writing Aard 2 (.slob) files'
  'python-marisa: Writing to Kobo E-Reader Dictionary'
  'python-lzo: Required for some MDX glossaries'
  'python-html5lib: Required to write to AppleDict'
)
makedepends=('python-setuptools')
provides=("pyglossary-git")
conflicts=("pyglossary" "pyglossary-git")
source=("git+https://github.com/ilius/${_pkgname}")
sha256sums=('SKIP')

pkgver() {                                                                                                                                                                                          
  cd "${_pkgname}"                                                                                                                                                                                  
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r'$(git rev-list --count HEAD)'.g/;s/-/./g'                                                                                                
}

package() {
  cd "${srcdir}/${_pkgname}"
  # required to make the modified alternatives for libraries such as gzip to be
  # loaded and used with python 3.10 // this is no longer required
  #cp -R pyglossary/plugin_lib/py39 pyglossary/plugin_lib/py310 
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
  cp config.json ${pkgdir}/usr/share/pyglossary
}

install=pyglossary.install

# vim:set ts=2 sw=2 et:
