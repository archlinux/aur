#Maintainer: KirisameMarisa <kirisamemarisa2023@proton.me>
pkgname="wallpaper-generator-next"
pkgver="5.0.1"
pkgrel=1
license=("GPL-3.0-only")
pkgdesc="壁纸生成器"
source=(
"https://github.com/SRInternet-Studio/Wallpaper-generator/archive/refs/tags/v$pkgver.zip"
"https://github.com/SRON-org/APICORE_Python/archive/refs/heads/main.zip"
"Pre-Use.zip"
"requirements-linux.txt"
"wallpaper-generator-next.desktop"
)
sha256sums=("SKIP"
"109ef954864f7796918be28e409644c427a25bee060a0c9c426a36ba44165036"
"6384e3c64ef38190129c55e415dc4f02f375e89e61bcaf61db3640d6934749a1"
"4f025bced3d1dac244c4c3c5721338f2c5797397d590ea36260746b1dcf03b01"
"a92fef2d9a2421532f83cae2af7a3bf21e4108fd5ee5b509749494c92cce7481"
)
arch=('x86_64')
url="http://www.sr-studio.cn"
depends=('python>=3.12'
'tk')
pkgdir=$startdir/pkg
SRCDEST=$startdir
prepare(){
    cp $SRCDEST/src/requirements-linux.txt "$SRCDEST/src/Wallpaper-generator-$pkgver"
    python -m venv "$SRCDEST/src/Wallpaper-generator-$pkgver/.venv"
    source "$SRCDEST/src/Wallpaper-generator-$pkgver/.venv/bin/activate"
    pip install -r "$SRCDEST/src/Wallpaper-generator-$pkgver/requirements-linux.txt"
    pip install $SRCDEST/src/APICORE_Python-main
}
build(){
    pyinstaller --noconfirm --onedir --windowed --icon "$SRCDEST/src/Wallpaper-generator-$pkgver/NewIcon.ico" --name "Wallpaper Generator NEXT" --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/BACKIMG1.png:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/NewIcon.ico:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/None.ico:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/boolean_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/emum_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/Exception_Handler.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/integer_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/MainWindowTemplate_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/MarketTemplate_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/PageTemplate_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/SettingsPage_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/string_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/V4Resources.qrc:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/V4Resources_rc.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/WelcomePage_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/WelcomePageNext_ui.py:." --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/acw_next:acw_next/" --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/fonts:fonts/" --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/Kernel:Kernel/" --add-data "$SRCDEST/src/Wallpaper-generator-$pkgver/UI:UI/"  "$SRCDEST/src/Wallpaper-generator-$pkgver/MainWindow.py"
    cp -r $SRCDEST/src/Pre-Use/* "$SRCDEST/src/dist/Wallpaper Generator NEXT"
}
package(){
    mkdir -p "$pkgdir/opt/wallpaper-genrator-next" "$pkgdir/usr/share/applications/"
    cp -r $SRCDEST/src/dist/Wallpaper\ Generator\ NEXT/* "$pkgdir/opt/wallpaper-genrator-next"
    cp "$SRCDEST/src/wallpaper-generator-next.desktop" "$pkgdir/usr/share/applications"
}
