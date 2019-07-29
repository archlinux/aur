# Mantainer: Giusy Margarita <kurmikon at libero dot it>
# Contributor: Jonian Guveli <jonian at hardpixel dot eu>
# Contributor: Jan Magnus Brevik <janmbrevik at gmail dot com>
# Contributor: Rubén Fdes Moreira <tmp-meteque at openmailbox dot com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: MacCyber <jonas dot enge at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>
# Contributor: Antti Hautaniemi <an7oine at me dot com>

_ubuntuver=18.04
_pkgbasename=acestream-engine
_enginename=acestreamengine

pkgname=acestream-engine-stable
pkgver=3.1.49
pkgrel=2
pkgdesc="P2P utility for multimedia live streaming and file transfer (stable version)"
arch=("x86_64")
url="http://acestream.org/"
license=("custom")
depends=(
    "net-tools"
    "python2-apsw"
    "python2-libappindicator"
    "python2-setuptools")
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
backup=("usr/lib/$_pkgbasename/acestream.conf")
install="$_pkgbasename.install"
source=(
    "$_pkgbasename.service"
    "$pkgname-$pkgver.tar.gz::http://acestream.org/downloads/linux/acestream_${pkgver}_ubuntu_${_ubuntuver}_x86_64.tar.gz"
    "$_pkgbasename.desktop"
    "LICENSE"
)
sha256sums=(
    "9446e4c36c2e92b4253a1c3fea5fa30d366d46295dcd1f1cac4ddfe8f002fcbe"
    "d2ed7bdc38f6a47c05da730f7f6f600d48385a7455d922a2688f7112202ee19e"
    "fad731aec3371b3e76065cf1668be6b61d33547d321c8cfb2b6018faa3d5b7b0"
    "SKIP"
)

package() {
    sed -i "/ROOT=/c\ROOT=\/usr/lib\/${_pkgbasename}" "start-engine"
    
    install -Dm755 "$_enginename" "$pkgdir/usr/lib/$_pkgbasename/$_enginename"
    install -Dm755 "start-engine" "$pkgdir/usr/lib/$_pkgbasename/start-engine"
    install -Dm644 "acestream.conf" "$pkgdir/usr/lib/$_pkgbasename/acestream.conf"
    install -Dm644 "data/images/streamer-32.png" "$pkgdir/usr/share/pixmaps/$_pkgbasename.png"
    install -Dm644 "$srcdir/$_pkgbasename.service" "$pkgdir/usr/lib/systemd/system/$_pkgbasename.service"
    install -Dm644 "$srcdir/$_pkgbasename.desktop" "$pkgdir/usr/share/applications/$_pkgbasename.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbasename/LICENSE"

    cp -a "data" "$pkgdir/usr/lib/$_pkgbasename/"
    cp -a "lib" "$pkgdir/usr/lib/$_pkgbasename/"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/usr/lib/$_pkgbasename/start-engine" "$pkgdir/usr/bin/$_enginename"
}
