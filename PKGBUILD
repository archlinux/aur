# Maintainer Ruijie Yu (first.last@outlook.com)

pkgname=appveyor-server
pkgver=7.0.2942
pkgrel=1
pkgdesc='Appveyor Server for Linux'
url='https://www.appveyor.com/self-hosted/'
arch=(x86_64)
license=(custom)
backup=(
    etc/sudoers.d/appveyor-server-sudoers
)

depends=(
    'dotnet-runtime'
    'libcap'
)
makedepends=()
source=(
    'https://www.appveyor.com/downloads/appveyor/appveyor-server.deb'
    'appveyor-check-version.sh'
    'ver.pgrep'
)
sha512sums=('695f1a60b012df6327ebc1a86d94da155ec5e9a0970ddd3040d0ed0bade1dce33d3b1ec490504b6e562266165e903987314f826bdb8642caaee0bb470893aaf2'
            '87be4ef80fba87fd648df4d98242131e18c290b831c0c91ef959f462eb167f607c088056831f0a2f3dbc679b8b4eb8e7596b641f57955eea63e4d1c29c8d93a8'
            'a0c55edb4d482876566db8a3178b3d7a318acae4185dbe28cae83482ae45e122495a99109a7ddf44b499cfd51f5c63dbfe15f480aa28add27af9f893375cc974')
b2sums=('4d1a39e7e3e7418fe4891841fe9da36a5072447bc8ce302a79a18f2a80e9a1dc9a0901d875f8938110bdaadfa8f453e5d36c195667eb8d670cd883baeb22a39b'
        '747cae436e1cc45871852c9070411ff11c82edf6f43723660684487b97df7a9ed69e468fb7d86b9dcc7899f915d6a443f14b18dcb4958fb4ea780885882db9f3'
        '44c2025bf9eb1a9125cb2182a688ddc6abba2403232ed99b0292c1fbcabdfd2230f322f86822c46d3d1496a47c68117e5ca055d825bfc361bd00184b6f8c2400')
noextract=(
    "${source[0]##*/}" # basename
)

pkgver() {
    bash "${srcdir}/${source[1]}" out
}

package() {
    bsdtar -O -xf "${srcdir}/${noextract[0]}" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # move license
    LICENSE_DIR="usr/share/licenses/${pkgname}"
    ORIG_LICENSE="usr/share/doc/appveyor-server/copyright" 
    install -dm0755 "${pkgdir}/${LICENSE_DIR}"
    mv "${pkgdir}/${ORIG_LICENSE}" "${pkgdir}/${LICENSE_DIR}/LICENSE"
    ln -s "/${LICENSE_DIR}/LICENSE" "${pkgdir}/${ORIG_LICENSE}"
}

