# Maintainer: Denys Zariaiev <denys.zariaiev@gmail.com>

pkgname=chitubox-free-bin
pkgver=1.7.0

pkgrel=1
pkgdesc="All-in-one SLA/DLP/LCD Slicer"

makedepends=('xdg-user-dirs')

url="https://www.chitubox.com/download.html"
arch=("any")
license=("Commercial")

DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
ARCHIVE_NAME="CHITUBOX_V${pkgver}.tar.gz"
DIR_NAME="CHITUBOX V${pkgver}"

if [ ! -f ${PWD}/$ARCHIVE_NAME ]; then
	if [ -f $DOWNLOADS_DIR/$ARCHIVE_NAME ]; then
		ln -sfn $DOWNLOADS_DIR/$ARCHIVE_NAME ${PWD}
	else
		msg2 ""
		msg2 "Please download the archive with ChiTuBox binaries v${pkgver} from https://www.chitubox.com/download.html"
		msg2 "You can either place it at '${PWD}/$ARCHIVE_NAME' or '$DOWNLOADS_DIR/$ARCHIVE_NAME'"
		msg2 ""
	fi
fi

options=(!strip)

source=(
    "local://$ARCHIVE_NAME"
    "local://chitubox-free.desktop"
)
sha256sums=(
    "ed6c4dbce4ea3e56ab90997f7522264e2666e42158fe8a18fd94ed71b8130445"
    "fdd0c1595cfa7ef97ae850b83de328db55150d76f42e6c472167bcc80f87ea47"
)

package()
{
    # binary data
    install -d "$pkgdir"/opt
    mv "${srcdir}/$DIR_NAME" "${pkgdir}/opt/chitubox-free"

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s "/opt/chitubox-free/CHITUBOX" "$pkgdir"/usr/bin/chitubox-free

    # desktop file
    install -Dm644 chitubox-free.desktop "$pkgdir"/usr/share/applications/chitubox-free.desktop
}
