# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=3.1.1
pkgrel=1
pkgdesc="A simple, cross-platform desktop application for viewing and editing PDF metadata (Java/JAR version)"
arch=('any')
url="https://github.com/zaro/pdf-metadata-editor"
license=('MIT')
depends=('java-runtime' 'bash') # JRE
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.jar"
        "${_pkgname}.desktop"
        "README.md"
        "LICENSE"
        "${_pkgname}.png"
        )
        
sha512sums=('1eaf0dfd12d1ec4e1f1a1bc2874abb75fcba7711424b642ce51c0239d13d228d9f9a173b2ee735d07831cff93a70d4a3b831576c4e6415a8e0654af33ca5ffe4'
            'fa1216a4172fd46642e04ad897a7b064e6efb37ec463a8e74263a2f77cc1e930c991d70cae7c453ad76bd3d4831ef53dd8ed44be703c6791f292c5385fcd0bb1'
            '793a6d6dc9b9e6e89dd9eb62604fc133e9a39916e7e7107c0213c600cf2b81641a3ab9a5614c9d8f386146e002a126b7748727653ba9abcaaab4be4400b8715e'
            '071951fc98d1200aa277fb7a3e9c12c10a58e987cd833fa46795721cead1734a6ca18e48e0d6ebc5ef20c962146bf4a7d2709e5a94078e71b964ac0df623d90b'
            '6da9c5d7c6ae8c4fb88a25de049dbc1b6a6b7591dd1f44d5030c97aa946330a39e0c63f4c2c67c6805b6f6e745707e3ec37eddf6ac738a1ebca83111ef481242')

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec java -jar "/usr/share/java/${_pkgname}/${_pkgname}.jar" "\$@"
EOF

    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
