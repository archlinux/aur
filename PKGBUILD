# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme-dark
_pkgname=Sweet-Dark
pkgver=6.0
pkgrel=1
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme-dark' 'sweet-gtk-theme-dark')
makedepends=('git')
_commit=7d80a1646e93ede3752fc53138909204cb98b882
source=(git+$url.git#commit=$_commit)
sha256sums=('3a48f5abffa845c4339c331cce8db4b5013041b582cb8d955f1d4278a579c20f')

prepare() {
  # Clean out some unneeded files to make installation a little more straightforward
  find ${_pkgname/-Dark/} -type f -name "*scss" -exec rm {} \;
  rm -fr ${_pkgname/-Dark/}/xfwm4/{assets,render_assets.fish}
}

package() {
  cd ${_pkgname/-Dark/}

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
  # install -Dm644 -t "${pkgdir}"/usr/share/themes/$_pkgname/xfwm4 xfwm4/*
}
