# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_applet_name=plasma-pstate
pkgname=plasma5-applets-${_applet_name}
pkgver=1.0.2
pkgrel=1
pkgdesc="Intel P-state and CPUFreq Manager Widget"
url="https://github.com/jsalatas/${_applet_name}"
arch=('any')
license=('GPL v2')
depends=('plasma-workspace')
source=("https://github.com/jsalatas/${_applet_name}/archive/${pkgver}.tar.gz")
sha256sums=('76a1a8e31707cb62915ad0bd15faea680896cc06386d0a626da40ffcc21be9cf')


package() {
  cd "${srcdir}/${_applet_name}-${pkgver}"

  _plasmoid_dir="${pkgdir}/usr/share/plasma/plasmoids"
  mkdir -p "${_plasmoid_dir}"
  cp -r "gr.ictpro.jsalatas.plasma.pstate" "${_plasmoid_dir}"

  _sudoers_dir="${pkgdir}/etc/sudoers.d"
  mkdir -p "${_sudoers_dir}"
  chmod 750 "${_sudoers_dir}"
  install 99-plasma-pstate "${_sudoers_dir}"
  sed -i 's/sudo/wheel/' "${_sudoers_dir}/99-plasma-pstate"
  chmod 400 "${_sudoers_dir}/99-plasma-pstate"
}


# SUDOERS_FILE="99-plasma-pstate"
# 
# cp -R ${SUDOERS_FILE} /etc/sudoers.d/
# plasmapkg2 -t plasmoid -g -i gr.ictpro.jsalatas.plasma.pstate
# 
# chmod 755 /usr/share/plasma/plasmoids/gr.ictpro.jsalatas.plasma.pstate/contents/code/set_prefs.sh
# 
# chown root:root /etc/sudoers.d/${SUDOERS_FILE}
# chmod 400 /etc/sudoers.d/${SUDOERS_FILE}
# 
# # Test for wheel group instead of sudo
# # this is the case of arch based distros
# wheelgroup=`grep wheel /etc/group | wc -l`
# sudogroup=`grep sudo /etc/group | wc -l`
# if [ "$wheelgroup" -eq "1" ] && [ "$sudogroup" -eq "0" ]; then
#     # seems to be safe enough: there is a wheel group and not a sudo group
#     sed -i 's/sudo/wheel/' /etc/sudoers.d/${SUDOERS_FILE}
# fi
# 
# echo -e "\nSetup complete."
# exit 0
