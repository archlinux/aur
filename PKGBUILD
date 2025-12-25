# Contributor: xeruf <27jf at pm dot me>
# Creator: dilipvamsi <m.dilipvamsi at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_pkgname='arangodb'
pkgname="${_pkgname}-bin"
#pkgdesc="Arangodb binary from deb."
pkgdesc="ArangoDB server is a native multi-model database with flexible data models for documents, graphs, and key-values"
pkgver=3.12.7
pkgrel=1
arch=('x86_64')
url="https://arango.ai"
license=('Apache-2.0')
provides=(${_pkgname})
conflicts=(
    "${_pkgname}"
    "${_pkgname}-client-bin"
)
#options=(!strip)
#source_x86_64=("https://download.arangodb.com/9c169fe900ff79790395784287bfa82f0dc0059375a34a2881b9b745c8efd42e/arangodb312/Enterprise/Linux/arangodb3e_$pkgver-1_amd64.deb")
source_x86_64=("https://download.arangodb.com/9c169fe900ff79790395784287bfa82f0dc0059375a34a2881b9b745c8efd42e/arangodb312/Enterprise/Linux/arangodb3e-linux-${pkgver}_$arch.tar.gz")
#source=("https://download.arangodb.com/arangodb$(echo "${pkgver}" | cut -d '.' -f1-2 | tr -d '.')/Community/Linux/arangodb3_${pkgver}-1_amd64.deb")
validpgpkeys=("CD8CB0F1E0AD5B52E93F41E7EA93F5E56E751E9B") # Frank Celler (ArangoDB Debian Repository) <info@arangodb.com>
sha256sums_x86_64=('566214dc890aa89b8e1efd30abe7a1b34205abc5d59139ab23c0d32020de7cb4')
install=arangodb.install

package() {
#    msg2 "Extracting the data.tar.gz..."
#    tar -xf "data.tar.gz" -C $pkgdir

#    msg2 "Removing /etc/init.d"
#    rm -r $pkgdir/etc/init.d

    adir="$srcdir/arangodb3e-linux-${pkgver}_${arch}"
    mkdir -p "$pkgdir/usr/bin"
    mv "$adir/usr/sbin"/* "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/"{share,licenses}
    mv "$adir/usr/share/arangodb3" "$pkgdir/usr/share"
    mkdir -p "$pkgdir/usr/share/doc/arangodb3"
	mv "$adir/usr/share/doc/arangodb3/"README.* "$pkgdir/usr/share/doc/arangodb3"
    mv "$adir/usr/share/doc" "$pkgdir/usr/share/licenses"
    mkdir -p "$pkgdir/usr/share/man/"{man1,man8}
    mv "$adir/usr/share/man/man1"/* "$pkgdir/usr/share/man/man1"
    mv "$adir/usr/share/man/man8"/* "$pkgdir/usr/share/man/man8"

#    msg2 "Changing /usr/sbin to /usr/bin in arangodb3.service"
#    sed -i 's/\/usr\/sbin/\/usr\/bin/g' "$pkgdir/lib/systemd/system/arangodb3.service"

#    msg2 "Moving /lib to /usr/lib"
#    mv "$srcdir/lib" "$pkgdir/usr"
}
