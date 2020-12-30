# Maintainer: sihuan <sihuan at sakuya.love>

pkgname=wechat-kylinos
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="麒麟OS微信 (风险魔改版)"
makedepends=(asar)
depends=(gtk2 gtk3 libxss gconf nss)
license=('custom')
source=('http://archive.kylinos.cn/kylin/partner/pool/wechat_2.0.0_amd64.deb')
sha512sums=('523bfc8983dd4506ac9280ae48eba45cbc993a5925de77e2705dd16b99c95c48d6a325b7b2b28c45b4ccb12db67cb08e27f9c158541cf4672f9e1cb26f987c5e')

prepare() {
    bsdtar -xf "$srcdir/data.tar.xz"
}

package() {
    asar extract "$srcdir/usr/lib/wechat/resources/app.asar" "$srcdir/usr/lib/wechat/resources/app"
    sed -i 's|let wcs;|return "Gv8GCPkGEvkGCggwMDAwMDAwMRAGGuAGomtlq/mOhQXWue473LKvUjEhatKQ338GLRNavgAhb2ET3z+3ejCXaYlrG7AfJ+QBphMSYvPhxQVyhwVvQarv9muy8HSoAAuQtV1DjpOIjQwcoa/wOCicjtUV8yp2W6vTrgea200WY7+vg95AT43/qDQ0WVSupawUWCKWuXNdvxsIPp/Y4d+YHkCvOV21/uea4WqILbfOZhd4OZsX6MEHcB322DXZZ0m89mSf0drCb+8mKEMLCGbXBCy5ZFD/YR0NTsaYFQTIDkF9eBCsi56MVNWYcp0+a51Tg2Cg2fNPFPtRZ7D5TlKftMTmKy1DAVVKWeXJqXjUyATQA+ZXRW3vrdP1pc6OMWxdhgR+71VDa++pfLO/kRJ5hUgpwR8/JzfOXEqGsi866CGy/J+wOXQUtXKew+RYXYFLpspq1Tbi61yYowsBUnSl8c8JIekAdqHTSQPX5qHij58QakUblQhm2czTcHI2+j3avjsRV9aqFHmJfSRcgwYBEEVxxyzK3/cJtTzWsBpW6N6VDdby0YExETdIRM5zaElXjg/AZqHxZCuhYJS3inR5aG5ypURZVqGWYIc9AJHJCu7PKrajIX1j4KlXgROyCxAov9uPLkd/fgjoIrg5rP2pIdyM+2nNbzcnsJj+DFxwa8JiURu08ez+sX43hC7WSSQ5205k2DrEb2Tp0iHLZ9QbbzLpnZsqaufMngKzvXPwq8GrFkJ+JIUkjfe9MQaNW/CONdkqRyAZDasJO9kHpYIFcP++A+9ErWsaUXm9WsCpkiTGJBeiS3u0gqBFXAS0oa128becqhFpK5LBOSxnk2YhUP2c7AJt1sv1Ysqo+6/Vh+AI09kDjontg/P6xqKEQGLdArlppJqeaUOOhs0270am/7YWhNqS69mpcslRkvFSyCAbI26g4lppzYp4U28rmFifSplR8NI6IO0dAWr4pS5mmov4pNA6WvvBpm078JaVlXOLOZj20T8JB08yNTZcFblD54Sn78ro4ooKsaA0ynUZjvFKvlKno64dqLlnFJudmR0Qx8yFcHQy/7Qqj+/AnjdLOJ0e7rAGMvoMIlnJnn6okhOeEKfCaZpG+v54ZWFeZs7f8SitfVlfEEhCQEHLTgRiu18PVwi7gHILzlQQoiFwUhBiKrA9Tnv6IIvtsP8FKAUwAA=="|g' \
        "$srcdir/usr/lib/wechat/resources/app/index.js"
    asar pack "$srcdir/usr/lib/wechat/resources/app" "$srcdir/usr/lib/wechat/resources/app.asar"
    rm -rf "$srcdir/usr/lib/wechat/resources/app"

    mkdir -p "$pkgdir/opt/wechat-kylinos"
    cp -pr "$srcdir/usr/lib/wechat/"* "$pkgdir/opt/wechat-kylinos/"
    
    
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/wechat-kylinos/微信 "$pkgdir/usr/bin/wechat-kylinos"

    install -Dm644 "$srcdir/usr/share/doc/wechat/copyright" "$pkgdir/usr/doc/wechat-kylinos/copyright"
    install -Dm644 "$srcdir/usr/share/pixmaps/wechat.png" "$pkgdir/usr/share/pixmaps/wechat-kylinos.png"

    echo "[Desktop Entry]
Version=2.0.0
Encoding=UTF-8
Name=wechat-kylinos
Comment=wechat for kylinos
Exec=wechat-kylinos
Icon=wechat-kylinos
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
Name[zh_CN]=微信
Comment[zh_CN]=微信 for kylinos
    " > "$srcdir/wechat-kylinos.desktop"
    install -Dm644 "$srcdir/wechat-kylinos.desktop" "$pkgdir/usr/share/applications/wechat-kylinos.desktop"
}
