# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>
# Contributor: Mike Tong <3344907598 [AT] qq.com>
pkgname=fcitx-sogouimebs
pkgver=2.0.0.38+0428.1
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://pinyin.sogou.com/linux/"
license=("custom")
conflicts=('fcitx-sogoupinyin')
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-webkit" "fcitx-qt5")

source=("http://archive.ubuntukylin.com/ukui/pool/main/s/sogouimebs/sogouimebs_${pkgver}_amd64.deb")
sha256sums=("80dbf56c876ec0c2e058f699bddc2e1b103e7671f8884e357b493c17799acc9d")

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu

    # Avoid warning "No such key "Gtk/IMModule" in schema "org.gnome.settings-daemon.plugins.xsettings""
    #sed -i "s#Gtk/IMModule=fcitx#overrides={"Gtk/IMModule":<"fcitx">}#" "$pkgdir"/usr/share/glib-2.0/schemas/50_sogoupinyin.gschema.override

    #rm -r "$pkgdir"/usr/share/keyrings
    rm -r "$pkgdir"/etc/X11
    # install -m755 sogou-autostart "$pkgdir"/usr/bin

    # Do not modify $pkgdir/etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop, as it is
    # a symlink to absolute path "/usr/share/applications/fcitx-ui-sogou-qimpanel.desktop"
    # sed -i "s/sogou-qimpanel\ %U/sogou-autostart/g" "$pkgdir"/usr/share/applications/fcitx-ui-sogou-qimpanel.desktop
}
