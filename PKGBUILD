# Maintainer: Markus Hartung <mail@hartmark.se>

pkgname=junie-eap
_binname=junie
provides=('junie')
conflicts=('junie')

pkgver=106.1
pkgrel=1
pkgdesc="Junie command‑line client"
arch=('x86_64' 'aarch64')
options=('!strip' 'staticlibs')
url="https://github.com/jetbrains-junie/junie"

license=('LicenseRef-Junie')
# License details: https://www.jetbrains.com/legal/docs/terms/jetbrains-junie/

depends=(
  'bash'
  'glibc'
  'gcc-libs'
  'zlib'
  'libx11'
  'libxext'
  'libxrender'
  'libxi'
  'libxtst'
  'alsa-lib'
  'freetype2'
  'harfbuzz'
  'libpng'
  'libjpeg-turbo'
  'lcms2'
  'giflib'
  'pcsclite'
)
optdepends=()

source=('LICENSE')

source_x86_64=("https://github.com/jetbrains-junie/junie/releases/download/${pkgver}/junie-eap-${pkgver}-linux-amd64.zip")
source_aarch64=("https://github.com/jetbrains-junie/junie/releases/download/${pkgver}/junie-eap-${pkgver}-linux-aarch64.zip")

sha512sums=('cb1277b44d0cf8fe650685013b5d4fa4ac01f4f7c42cc90c94990c9dfde71b7ff19210d0f9c766990d56058c0516ddd5b4ba9710da30ceed27cd11dbb1288c52')
sha512sums_x86_64=('ea800c665f4e399beee6e204fddfc1ed700ed70d55377f33eb6caf07fb0201d5023e788e04eb73c126f27d61127930badab0e909815ff1740a2735837918fc7b')
sha512sums_aarch64=('0f05b8dbb47a98f68a343cd8aa6543e9968b02fea4b1e13200587720f9c0ab58ebe16a41e274ba588785a6ee6d123b3768f6ba3df65a511536bc3e0907459f98')

package() {
    cd "${srcdir}"

    install -dm755 \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/lib/${pkgname}" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -R --no-preserve=ownership \
        "${srcdir}/junie-app/"* \
        "${pkgdir}/usr/lib/${pkgname}/"

    cat << 'EOF' > "${pkgdir}/usr/bin/${_binname}"
#!/usr/bin/env bash
exec /usr/lib/junie-eap/bin/junie "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${_binname}"

    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:set ts=2 sw=2 et:
