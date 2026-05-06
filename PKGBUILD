# Maintainer: lucas007 <lucaszhou007@163.com>
_pkggroupname="HBuilderX"
_pkgname="hbuilderx"
pkgname="hbuilderx-bin"
pkgver="5.07.2026041006"
pkgrel=1
epoch=1
provides=('HBuilderX')
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64' "aarch64" "loong64")
url="https://www.dcloud.io"
license=('unknown')
source=(
"https://download1.dcloud.net.cn/download/$_pkggroupname.$pkgver.linux_x64.full.tar.gz"
"${_pkgname}.service"
)
sha256sums=('eb4f6a4000ec893a4e149fb9bfd03f1cd16a84810c31f07f4c1d4bc95c59437e'
            '69d7d79be0b001e495e7417c6d6a8c50951e76563e0c394cd8007618b748826b')
options=(!strip !debug)

package() {
      install -Dm 644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

      install -d "$pkgdir/opt/$_pkgname"
      cp -r "$srcdir/$_pkggroupname/"* "$pkgdir/opt/$_pkgname"
      # 创建符号链接以便在终端中直接使用cli命令
      install -d "$pkgdir/usr/bin"
      ln -s "/opt/$_pkgname/cli" "$pkgdir/usr/bin/hbuilderx-cli"
}

# makepkg -g
# updpkgsums
# makepkg -sf
# makepkg --printsrcinfo > .SRCINFO
