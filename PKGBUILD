# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=timelens-git
pkgver=0.1.0.r0.d6e4026
pkgrel=1
pkgdesc="Creates visual timelines from video files, to visualize color development. Inspired by the moviebarcode tumblr."
arch=('i686' 'x86_64')
url="https://github.com/timelens/timelens"
license=('GPL')
provides=('timelens')
conflicts=('timelens')
depends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('git' 'rust')
source=("$pkgname::git+https://github.com/timelens/timelens")
sha1sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release
}

pkgver() {
    cd "$pkgname"
    local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/timelens" "$pkgdir/usr/bin/timelens"
}
