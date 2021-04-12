# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributor: Daniel Pereira <daniel@garajau.com.br>
# Contributor: Florian Mounier aka paradoxxxzero <paradoxxx.zero@gmail.com>
# Contributor: Michael Schubert <mschu.dev at gmail>

_reponame=gnome-shell-system-monitor-applet
pkgname=gnome-shell-extension-system-monitor-git
pkgver=1055.942603d
pkgrel=1
pkgdesc="System monitor extension for Gnome-Shell (display mem swap cpu usage)"
arch=('any')
url="http://github.com/paradoxxxzero/gnome-shell-system-monitor-applet"
license=('GPL3')
depends=('gnome-shell>=3.10' 'libgtop' 'networkmanager')
makedepends=('git')
provides=("system-monitor-applet" "gnome-shell-system-monitor-applet-git")
replaces=("gnome-shell-system-monitor-applet-git")
conflicts=("gnome-shell-system-monitor-applet-git")
install="gschemas.install"
source=('git+https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git' gnome-40.patch)
sha256sums=('SKIP'
            'c0d4d5456eb865949f8b21834b5792331a8979241c4c6a9d647014902e06ff5c')

package() {
  cd "$srcdir/$_reponame"
  git apply "$srcdir/gnome-40.patch"

  # Install the extension
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -R "system-monitor@paradoxxx.zero.gmail.com" "$pkgdir/usr/share/gnome-shell/extensions"

  # Install the gschema
  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  install -m 644 "system-monitor@paradoxxx.zero.gmail.com/schemas/org.gnome.shell.extensions.system-monitor.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/"
}

pkgver() {
  cd $_reponame
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
