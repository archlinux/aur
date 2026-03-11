# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

pkgname=source-to-image-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A tool for building artifacts from source and injecting into container images"
arch=('x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache-2.0')
source=("https://github.com/openshift/source-to-image/releases/download/v${pkgver}/source-to-image-v${pkgver}-906fe48a-linux-amd64.tar.tar.gz")
sha256sums=('e0cc6110bec4342385ea981ec81bf73e42ab2754e0270d8df1011af788221e69')

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
