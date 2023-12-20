# Maintainer: Davron <xamdamovdavron6@gmail.com>
pkgname='jprq'
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="This is a free and open tool for exposing local servers to public network (the internet)"
arch=('any')
license=('MIT')
url="https://github.com/azimjohn/jprq/releases/download/2.2/jprq-darwin-amd64"

build() {
	set -e

	URL_PREFIX="https://github.com/azimjohn/jprq/releases/download/2.2"

	case "$(uname -sm)" in
	  "Darwin $CARCH") FILENAME="jprq-darwin-amd64" ;;
	  "Darwin $CARCH") FILENAME="jprq-darwin-arm64" ;;
	  "Linux $CARCH") FILENAME="jprq-linux-amd64" ;;
	  "Linux $CARCH") FILENAME="jprq-linux-386" ;;
	  *) echo "Unsupported architecture: $(uname -sm)" >&2; exit 1 ;;
	esac

	echo "Downloading $FILENAME from github releases"
	if ! curl -sSLf "$URL_PREFIX/$FILENAME" -o "jprq"; then
	  echo "Failed to write to $INSTALL_DIR; try with sudo" >&2
	  exit 1
	fi

	echo "jprq is successfully installed"
}

package() {
    install -Dm755 ./jprq "$pkgdir/usr/bin/jprq"
}
