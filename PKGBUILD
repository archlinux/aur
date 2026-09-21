# Maintainer: chenpi11 <chenpi11@users.noreply.github.com>
pkgname=sub-store-front-end-git
pkgver=2.32.2.r0.g6284035
pkgrel=1
pkgdesc='Sub-Store Progressive Web App (git)'
arch=('any')
url='https://github.com/sub-store-org/Sub-Store-Front-End'
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'pnpm')
provides=('sub-store-front-end')
conflicts=('sub-store-front-end' 'sub-store-front-end-bin')
source=('git+https://github.com/sub-store-org/Sub-Store-Front-End.git')
sha256sums=('SKIP')

pkgver() {
    cd Sub-Store-Front-End
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Sub-Store-Front-End
    pnpm install --frozen-lockfile
}

build() {
    cd Sub-Store-Front-End
    pnpm build
}

package() {
    # Install web app files
    install -dm755 "$pkgdir/usr/share/sub-store-front-end"
    cp -r "$srcdir/Sub-Store-Front-End/dist"/* "$pkgdir/usr/share/sub-store-front-end/"

    # Install LICENSE
    install -Dm644 "$srcdir/Sub-Store-Front-End/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo '==> Sub-Store Front-End (git) has been installed!'
    echo '==> Web app files are located at: /usr/share/sub-store-front-end/'
    echo '==> You can serve these files with any web server (nginx, apache, etc.)'
    echo '==> Backend: https://github.com/sub-store-org/Sub-Store'
}
