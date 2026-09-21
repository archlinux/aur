# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=colibri-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='Tiny local inference engine for large MoE models (prebuilt)'
arch=('x86_64')
url='https://github.com/JustVugg/colibri'
license=('Apache-2.0')
depends=('python' 'gcc-libs')
optdepends=(
    'python-numpy: image/audio features and converters'
    'python-pillow: multimodal image input'
    'python-huggingface-hub: model download helpers for convert'
)
provides=('colibri')
conflicts=('colibri')
source=(
    "https://github.com/JustVugg/colibri/releases/download/v${pkgver}/colibri-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('acb9fcb0b5313ee8dc217133a887233371708e3b6095a803a9afbabda69b81c1')

package() {
    local libexec="${pkgdir}/usr/libexec/colibri"

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${libexec}/tools"
    install -dm755 "${libexec}/web/dist"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Launcher on PATH; engines and support files under libexec (upstream layout).
    install -Dm755 "${srcdir}/coli" "${pkgdir}/usr/bin/coli"

    install -Dm755 "${srcdir}/colibri" "${libexec}/colibri"
    install -Dm755 "${srcdir}/glm53" "${libexec}/glm53"
    install -Dm755 "${srcdir}/inkling" "${libexec}/inkling"
    install -Dm755 "${srcdir}/kimi_k3" "${libexec}/kimi_k3"
    install -Dm755 "${srcdir}/olmoe" "${libexec}/olmoe"
    install -Dm755 "${srcdir}/qwen36" "${libexec}/qwen36"
    install -Dm755 "${srcdir}/qwen38" "${libexec}/qwen38"
    install -Dm755 "${srcdir}/deepseek_v4" "${libexec}/deepseek_v4"

    install -Dm644 "${srcdir}/family_registry.py" "${libexec}/family_registry.py"
    install -Dm644 "${srcdir}/resource_plan.py" "${libexec}/resource_plan.py"
    install -Dm644 "${srcdir}/doctor.py" "${libexec}/doctor.py"
    install -Dm644 "${srcdir}/autotune.py" "${libexec}/autotune.py"
    install -Dm644 "${srcdir}/openai_server.py" "${libexec}/openai_server.py"
    install -Dm644 "${srcdir}/cluster.py" "${libexec}/cluster.py"
    install -Dm644 "${srcdir}/v4_dsml.py" "${libexec}/v4_dsml.py"
    install -Dm644 "${srcdir}/version.py" "${libexec}/version.py"

    install -Dm644 "${srcdir}/tools/"* "${libexec}/tools/"
    cp -a "${srcdir}/web/dist/." "${libexec}/web/dist/"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    "${srcdir}/coli" --help >/dev/null
}
