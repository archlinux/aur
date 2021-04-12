# Maintainer: f1reflyylmao <f1refly@airmail.cc>
# Contributor: Tony André Haugen (t0nyandre) <post@tonyand.re>

pkgname=scry-git
_gitname=scry
pkgver=203.8e8e822
pkgrel=1
pkgdesc="Scry is a language server for Crystal."
arch=("x86_64")
url="https://github.com/crystal-lang-tools/${_gitname}"
license=("MIT")
depends=("git" "crystal" "shards")
provides=("scry")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
        cd $_gitname
        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
        cd "$srcdir/$_gitname"
	shards install
        shards build --production --release --no-debug --progress "${_gitname}"
}

package() {
        cd "$srcdir/$_gitname"
        install -D -m 0755 "./bin/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
        install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
