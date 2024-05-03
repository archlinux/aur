# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme
_pkgname=Sweet
pkgver=4.0
pkgrel=1
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme')
makedepends=('git')
_commit=fff466f73dc27db52cf4a487f86fbe893bbfbf0a
source=(git+$url.git#commit=$_commit)
sha256sums=('bd182bcdbaab20d513da7e3e5515de047aae318ba794dfd4e30e02480ce1e6f7')

prepare() {
  # Clean out some unneeded files to make installation a little more straightforward
  find $_pkgname -type f -name "*scss" -exec rm {} \;
  rm -fr $_pkgname/xfwm4/{assets,render_assets.fish}
}

package() {
  cd $_pkgname

  # Generic assets
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname {LICENSE,README.md,index.theme}
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/assets assets/*

  # Cinnamon
  cp -r cinnamon "${pkgdir}"/usr/share/themes/$_pkgname/

  # GNOME
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gnome-shell/ gnome-shell/gnome-shell.css
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gnome-shell/assets gnome-shell/assets/*

  # GTK2
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gtk-2.0 gtk-2.0/{gtkrc,main.rc}
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gtk-2.0/apps gtk-2.0/apps/*
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gtk-2.0/assets gtk-2.0/assets/*

  # GTK3
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gtk-3.0 gtk-3.0/{gtk-dark.css,gtk.css,thumbnail.png}

  # GTK4
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/gtk-4.0 gtk-4.0/{gtk-dark.css,gtk.css,thumbnail.png}

  # Metacity
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/metacity-1 metacity-1/*

  # xfwm
  install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/xfwm4 xfwm4/*
}
