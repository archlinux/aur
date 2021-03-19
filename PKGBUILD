# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
# official binary have kime-window
conflicts=('kime')
provides=('kime')
optdepends=('dbus: indicator support'
            'gtk2: gtk2 support'
            'gtk3: gtk3 support'
            # official binary doesn't have gtk4
            # 'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'libxcb: xim support'
            'cairo: xim support')
arch=('x86_64')
license=('GPL3')
source=("https://github.com/Riey/kime/releases/download/v${pkgver}/kime_latest_v${pkgver}.tar.zst")
md5sums=('5792b9d1dbe47a5aa14f1596aebbddee')

package() {
    install -Dm755 kime-check -t "${pkgdir}/usr/bin"
    install -Dm755 kime-indicator -t "${pkgdir}/usr/bin"
    install -Dm755 kime-xim -t "${pkgdir}/usr/bin"
    install -Dm755 kime-wayland -t "${pkgdir}/usr/bin"
    install -Dm755 libkime-gtk2.so -T "${pkgdir}/usr/lib/gtk-2.0/2.10.0/immodules/im-kime.so"
    install -Dm755 libkime-gtk3.so -T "${pkgdir}/usr/lib/gtk-3.0/3.0.0/immodules/im-kime.so"
    # install -Dm755 libkime-gtk4.so -t "${pkgdir}/usr/lib/gtk-4.0/4.0.0/immodules"
    install -Dm755 libkime-qt5.so -T "${pkgdir}/usr/lib/qt/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime-qt6.so -T "${pkgdir}/usr/lib/qt6/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
    install -Dm755 libkime_engine.so -t "${pkgdir}/usr/lib"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 kime_engine.h -t "${pkgdir}/usr/include"
    install -Dm644 kime_engine.hpp -t "${pkgdir}/usr/include"
    install -Dm644 default_config.yaml -T "${pkgdir}/etc/xdg/kime/config.yaml"
    for d in *.desktop; do
        install -Dm644 "$d" -t "${pkgdir}/usr/share/applications"
    done
    for i in icons/64x64/*; do
        install -Dm644 "$i" -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
    done
}

