# Maintainer: lucas007 <lucaszhou007@163.com>
_pkggroupname="HBuilderX"
_pkgname="hbuilderx-alpha"
pkgname="hbuilderx-alpha-bin"
pkgver="5.22.2026072503"
pkgrel=1
epoch=1
provides=('HBuilderX-alpha')
pkgdesc="cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。"
arch=('x86_64' "aarch64" "loong64")
url="https://www.dcloud.io"
license=('unknown')
source=(
"https://download1.dcloud.net.cn/download/$_pkggroupname.$pkgver-alpha.linux_x64.full.tar.gz"
"${_pkgname}.service"
)
sha256sums=('ca4d099f85b11c08d5860d319db141a82f3d8cd8e6693a2e6ecba467d7846643'
            'f7aff3457c19ee0b27a864d9147b64c53b43ab2186a96f29ede685fdbcca57df')
options=(!strip !debug)

package() {
      install -Dm 644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

      install -d "$pkgdir/opt/$_pkgname"
      cp -r "$srcdir/$_pkggroupname/"* "$pkgdir/opt/$_pkgname"
      # 创建符号链接以便在终端中直接使用cli命令
      install -d "$pkgdir/usr/bin"
      ln -s "/opt/$_pkgname/cli" "$pkgdir/usr/bin/hbuilderx-alpha-cli"
}

# makepkg -g
# updpkgsums
# makepkg -sf
# makepkg --printsrcinfo > .SRCINFO
