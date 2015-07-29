# $Id$
# Original Community Repo
# =======================
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

# Modificationt to use Git Master Source
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGBUILD as closely as possible matches community's virt-manager 1.2.1-1
#    * All namcap warnings are identical, as of 1.2.1.r4564.466bf92

pkgbase=virt-manager-git
_pkgbase=virt-manager
pkgname=(virt-install-git virt-manager-git)
pkgver=1.2.1.r4564.466bf92
pkgrel=1
pkgdesc="Console user interface for managing virtual machines"
arch=('any')
url="http://virt-manager.org/"
license=('GPL')
depends=('python2' 'libvirt-python' 'libxml2' 'libvirt' 'urlgrabber'
	 'libosinfo' 'python2-ipaddr' 'python2-gobject')
makedepends=('intltool>=0.35.0'
	     'dbus-python' 'gtk-vnc' 'rarian'
	     'gconf' 'yajl' 'librsvg' 'python2-gconf' 'libuser'
	     'python2-ipy' 'newt-syrup' 'openbsd-netcat' 'x11-ssh-askpass'
	     'graphite' 'spice-gtk3'
	     'libvirt-glib' 'vte3' 'git')
source=("git+https://git.fedorahosted.org/git/${_pkgbase}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  echo $(cat virtcli/cliconfig.py | grep '^__version__' | sed 's|^__version__ = "||' | sed 's|"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py build
}

package_virt-install-git() {
  conflicts=('virt-install')
  provides=('virt-install')
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root "$pkgdir"
}

package_virt-manager-git() {
  conflicts=('virt-manager')
  provides=('virt-manager')
  install=virt-manager.install
  depends=('virt-install-git'
	    'python2' 'libvirt-python' 'libxml2' 'libvirt' 'urlgrabber'
	    'dbus-python' 'gtk-vnc' 'rarian'
	    'gconf' 'yajl' 'librsvg' 'python2-gconf' 'libuser'
	    'python2-ipy' 'newt-syrup' 'openbsd-netcat' 'x11-ssh-askpass'
	    'graphite' 'spice-gtk3'
	    'libvirt-glib' 'vte3')
}
