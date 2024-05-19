# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

pkgname=source-to-image-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool for building artifacts from source and injecting into container images"
arch=('x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache-2.0')
source=("https://github.com/openshift/source-to-image/releases/download/v${pkgver}/source-to-image-v${pkgver}-d3544c7e-linux-amd64.tar.gz")
sha256sums=('bd2cfd94bf9ed07a7ae990ce5eef358d3f8fb29327bc9614c82aab03f4ec0feb')

build() {
    ${srcdir}/s2i completion bash > ${srcdir}/s2i.bash
    ${srcdir}/s2i completion zsh  > ${srcdir}/s2i.zsh
    sed -i '1i#compdef s2i' ${srcdir}/s2i.zsh
}

package() {
    install -D -m644 ${srcdir}/s2i.bash ${pkgdir}/usr/share/bash-completion/completions/s2i
    install -D -m644 ${srcdir}/s2i.zsh  ${pkgdir}/usr/share/zsh/site-functions/_s2i
    install -D -m755 ${srcdir}/s2i      ${pkgdir}/usr/bin/s2i
    ln -s s2i                         	${pkgdir}/usr/bin/sti
}
