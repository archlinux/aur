# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=sanguosha
pkgver=1.0.8
pkgrel=2
pkgdesc="SanGuoSha Online (三国杀)"
url="https://www.sanguosha.com"
arch=('x86_64')
license=('custom')
depends=('electron13')
makedepends=('imagemagick')
source=("SGSOL_SetUp.exe::https://olh5download.sanguosha.com/olh5/wd/win/official/SGSOL_SetUp.exe?v=$pkgver"
	'logo.webp::https://is3-ssl.mzstatic.com/image/thumb/Purple112/v4/49/64/fe/4964fe0b-0663-2998-b862-fce1c515ccbd/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.webp'
        'sanguosha.desktop'
        'sanguosha.sh'
)
sha256sums=('e5ea9b748dc6bdf474b853eff812398e5725c51ff906b8ef66cfccad7acbc7ff'
            'bb04490fc7ebe363349c1a59ffa2e8f2a8005143a281fab73a7084134283c68e'
            '56ff518ef3ec397f2208b3e4dbcb4f67f533e7b0d6d121b24a5e974013925e58'
            'f68e3726f9adda9e84747f6983598efb85526ee086fabd9fd28fd24cbf08fa17')
noextract=('SGSOL_SetUp.exe')

build() {
    7z x SGSOL_SetUp.exe '$PLUGINSDIR/app-64.7z'
    7z x './$PLUGINSDIR/app-64.7z' 'resources*'
    convert logo.webp icon.png
}

package() {
    install -Dm644 resources/app.asar ${pkgdir}/usr/lib/${pkgname}/${pkgname}.asar

    install -Dm755 sanguosha.sh ${pkgdir}/usr/bin/sanguosha

    # Install desktop file
    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -Dm644 sanguosha.desktop -t ${pkgdir}/usr/share/applications/
}
