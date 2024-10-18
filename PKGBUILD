# Maintainer: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=7.33.85330.89
pkgrel=4
pkgdesc='Static code analyzer for C and C++'
arch=('pentium4' 'x86_64')
url=http://www.${pkgname}.com/en/${pkgname}
license=('custom:pvs-studio')
depends_pentium4=('qemu-headless-arch-extra')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code'
            'bash-completion: for bash completion'
            'strace: for analyzing via using strace logs')
options=('!strip' '!debug')
install=${pkgname}.install
_name=${pkgname}-${pkgver}-x86_64
source=(${_name}.tgz::http://files.${pkgname}.com/${pkgname}-latest.tgz)
source_pentium4=(${pkgname}.binfmt.d)
sha256sums=('4ddae5ab770bc6160e4d5f6a8db76078ee574745b2dbe22373b6e0e4a0db62b9')
sha256sums_pentium4=('fd7b1f7b48aa84205c1c0f60f630f1a33504e0e4904c5b0e8ae2477494899c97')

package() {
  # binfmt for pentium4
  if [ $CARCH == ${arch[0]} ]; then
    install -Dm644 ${pkgname}.binfmt.d ${pkgdir}/usr/lib/binfmt.d/${pkgname}.conf
  fi

  # PVS-Studio
  install -Dm755 -t ${pkgdir}/usr/bin \
    ${_name}/bin/${pkgname} \
    ${_name}/bin/${pkgname}-analyzer \
    ${_name}/bin/plog-converter

  # Bash completion
  install -Dm644 ${_name}/etc/bash_completion.d/${pkgname}.sh \
                 ${pkgdir}/etc/bash_completion.d/${pkgname}.sh

  # License
  install -Dm644 ${_name}/share/doc/${pkgname}/License.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
