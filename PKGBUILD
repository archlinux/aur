# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
_pkgname=SteamTokenDumper
pkgname=${_pkgname,,}-bin
pkgver=2025.04.28
pkgrel=1
pkgdesc='Steam token dumper for SteamDB'
arch=('x86_64' 'x86_64_v3')
url='https://steamdb.info/tokendumper/'
license=('MIT')
backup=("opt/${pkgname%-bin}/$_pkgname.config.ini")
makedepends=('coreutils')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}.sh")
source_x86_64=("${_pkgname}-${pkgver}-linux-x64.tar.gz::https://github.com/SteamDatabase/${_pkgname}/releases/download/${pkgver}/${_pkgname}-linux-x64.tar.gz")
source_x86_64_v3=("${source_x86_64[@]}")
sha256sums=('b9e3c64ecfc793401d4397a9fb789da87fe4b49dcd30fe97855ac0aa4b91cabd')
sha256sums_x86_64=('7744cf3e73ae4a3e9505c1a044b7772af0e81558d1a531afb91c20006312eac7')
sha256sums_x86_64_v3=('7744cf3e73ae4a3e9505c1a044b7772af0e81558d1a531afb91c20006312eac7')

package(){
  depends=('libz.so=1-64' 'glibc' 'gcc-libs' 'sh')  # TODO: Depend on .so files instead of packages
  optdepends=('unionfs-fuse: mounting user writable settings etc. directory')

  install -Dm755 SteamTokenDumper "$pkgdir"/opt/${pkgname%-bin}/SteamTokenDumper
  install -Dm644 SteamTokenDumper.config.ini "$pkgdir"/opt/${pkgname%-bin}/SteamTokenDumper.config.ini
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname%-bin}/LICENSE.txt
  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir"/usr/bin/${pkgname%-bin}
}
