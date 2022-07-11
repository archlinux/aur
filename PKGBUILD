# Maintainer: Einar Arnason einsiarna@gmail.com

ORG_NAME=oauth2-proxy
REPO_NAME=oauth2-proxy
LATEST_INFO="$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest)"
TAG=$(echo "$LATEST_INFO" | grep "tag_name" | cut -d'"' -f4)

pkgname=$REPO_NAME-bin-latest
pkgver="${TAG//v/}"
pkgrel=1
pkgdesc="A reverse proxy and static file server that provides authentication using Providers (Google, GitHub, and others) to validate accounts by email, domain or group."
arch=("any")
url="https://github.com/$ORG_NAME/$REPO_NAME"
license=("GNU")
backup=()
provides=("$REPO_NAME" "$REPO_NAME-bin-latest")
conflicts=("$REPO_NAME" "$REPO_NAME-git" "$REPO_NAME-bin")
source=(
    "https://github.com/$REPO_NAME/$REPO_NAME/releases/download/$TAG/oauth2-proxy-$TAG.linux-amd64.tar.gz"
    "$REPO_NAME@.service"
    "$REPO_NAME.cfg.example"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)
depends=()
makedepends=()
optdepends=()
install=$REPO_NAME.install
options=()

pkgver() {
    echo "${TAG//v/}"
}

package() {
    install -Dm 644 "$srcdir/$REPO_NAME.cfg.example" "$pkgdir/etc/$REPO_NAME/$REPO_NAME.cfg.example"
    install -Dm 755 "$srcdir/$REPO_NAME-$TAG.linux-amd64/$REPO_NAME" "$pkgdir/usr/bin/$REPO_NAME"
    install -Dm 644 "$srcdir/$REPO_NAME@.service" "$pkgdir/usr/lib/systemd/system/$REPO_NAME@.service"
}
