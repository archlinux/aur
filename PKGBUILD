# Maintainer: Incomplete <incomplete@aixon.co>

pkgname=doc-browser-git
pkgdesc="An API documentation browser with support for DevDocs and Hoogle"
# pkgver will be updated with pkgver()
pkgver=NA
pkgrel=6
license=('MPL-2.0')
url="https://github.com/qwfy/doc-browser"
arch=('x86_64')

# An array of packages this package depends on to run
depends=('qt5-base'
         'qt5-quickcontrols'
         'qt5-webengine'
         'pcre'
         'xz'
         'zlib'
         'openssl'
         'mathjax'
         'xclip'
         'xdg-utils')

# An array of packages this package depends on to build but are not needed at runtime
makedepends=('stack'
             'alex'
             'happy'
             'c2hs')

source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
  git rev-parse master
}

build() {
	cd "${pkgname}"
  stack build
}

package() {
	cd "${pkgname}"

  install -D -m755 "$(stack path --local-install-root)/bin/doc-browser" "${pkgdir}/usr/bin/doc-browser"

  install -D -m644 doc-browser.bash-completion "${pkgdir}/etc/bash_completion.d/doc-browser.bash"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/doc-browser/LICENSE"
  install -D -m644 doc-browser.desktop "${pkgdir}/usr/share/applications/doc-browser.desktop"
  install -D -m644 icon.svg "${pkgdir}/usr/share/icons/doc-browser.svg"
}
