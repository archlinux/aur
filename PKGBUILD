# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_applet_name=plasma-pstate
pkgname=plasma5-applets-${_applet_name}
pkgver=1.0.6
pkgrel=2
pkgdesc="Intel P-state and CPUFreq Manager Widget"
url="https://github.com/jsalatas/${_applet_name}"
arch=('any')
license=('GPL2')
depends=('plasma-workspace')
makedepends=('sed')
optdepends=("libsmbios: Dell's Thermal Management Feature"
            "x86_energy_perf_policy: If your processor doesn't support EPP i.e. older generations without HWP")
source=("https://github.com/jsalatas/${_applet_name}/archive/${pkgver}.tar.gz")
sha256sums=('b2abb03e9fe939fd6f516b8e65ef0badad2558c0b55687dd044756523e3900dc')

package() {
  cd $srcdir/$_applet_name-$pkgver

  _plasmoid_dir=$pkgdir/usr/share/plasma/plasmoids
  mkdir -p $_plasmoid_dir
  cp -r "gr.ictpro.jsalatas.plasma.pstate" $_plasmoid_dir

  _sudoers_dir=$pkgdir/etc/sudoers.d
  mkdir -p $_sudoers_dir
  chmod 750 $_sudoers_dir
  install 99-plasma-pstate $_sudoers_dir
  sed -i 's/sudo/wheel/' $_sudoers_dir/99-plasma-pstate
  chmod 400 $_sudoers_dir/99-plasma-pstate
}
