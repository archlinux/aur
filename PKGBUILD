# Maintainer: Chris Warrick <aur@chriswarrick.com>
# Contributor: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>
pkgbase=nikola-git
_pyname=nikola
_gitname=nikola
pkgname=('nikola-git' 'python-nikola-doc-git')
pkgver=7.8.8.r170.g1a9049ca
pkgrel=1
pkgdesc='A modular, fast, simple, static website generator. (git version)'
arch=('any')
url='https://getnikola.com/'
license=('MIT')
options=(!emptydirs)
depends=('python' 'python-doit' 'python-pygments' 'python-pillow'
         'python-docutils' 'python-mako' 'python-unidecode' 'python-lxml'
         'python-yapsy>=1.11.223' 'python-pyrss2gen' 'python-dateutil' 'python-logbook'
         'python-blinker' 'python-natsort' 'python-setuptools'
         'python-requests' 'python-husl' 'python-piexif' 'python-markdown')
optdepends=('python-jinja: for Jinja2 themes'
            'python-pyphen>=0.9.1: for hyphenation'
            'python-pygal=1.7.0: for SVG graph plotting'
            'python-typogrify>=2.0.4: for typographical enhancements'
            'python-webassets: for bundling assets'
            'ipython-notebook: for ipynb support'
            'ipython: for ipynb support'
            'python-ghp-import>=0.4.1: for uploading to GitHub Pages'
            'python-micawber: for embedding media in posts'
            'python-phpserialize: for WordPress imports'
            'python-ws4py: for nikola auto'
            'python-watchdog: for nikola auto')
makedepends=('git')
source=("git+https://github.com/getnikola/${_gitname}.git")
md5sums=('SKIP')
conflicts=('python-nikola' 'python2-nikola' 'python-nikola-git' 'python2-nikola-git' 'nikola')
replaces=('python-nikola-git' 'python2-nikola-git')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package_nikola-git() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  ln -s ${_gitname} "${pkgdir}/usr/bin/${_gitname}3"

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgbase}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python-nikola-doc-git() {
  pkgdesc="(deprecated -- merged into 'nikola-git')"
  install='python-nikola-doc-git.install'
  optdepends=()
  depends=()
  echo "WARNING: python-nikola-doc-git is deprecated, please uninstall it"
}

# vim:set ts=2 sw=2 et:
