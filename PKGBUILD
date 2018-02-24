# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Constantin Lorenz <Cons27773964@aol.com>

pkgname=sandboxed-tor-browser-git
_gitname=sandboxed-tor-browser
pkgver=337.fc34757
pkgrel=1
pkgdesc="A sandboxed version of the Tor Browser, git version"
arch=('x86_64')
url="https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Sandbox/Linux"
license=('AGPL3')
depends=('bubblewrap' 'gtk3' 'gnome-themes-standard' 'libnotify')
makedepends=('git' 'go' 'gb')
conflicts=('sandboxed-tor-browser')
provides=('sandboxed-tor-browser')
source=('git+https://git.torproject.org/tor-browser/sandboxed-tor-browser.git'
        "${_gitname}.desktop"
        "${_gitname}.png")
sha256sums=('SKIP'
            '66888e2f94e56d72b7c41dc8d3cd99a2c72b5460d1f8366c503b86aecb593fbd'
            '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}


build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  install -Dm 644 "${_gitname}.desktop" \
    "${pkgdir}/usr/share/applications/${_gitname}.desktop"
  install -Dm 644 "${_gitname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_gitname}.png"
  install -Dm 755 "${srcdir}/${_gitname}/bin/sandboxed-tor-browser" \
    "${pkgdir}/usr/bin/sandboxed-tor-browser"
}
