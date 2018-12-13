# Maintainer: Cezar Mathe <cezarmathe@gmail.com>
pkgname=repotools
pkgver=0.1.1
pkgrel=3
pkgdesc="Utility for creating and maintaining custom user repositories."
arch=(x86_64)
url="https://github.com/cezarmathe/repotools"
license=('MIT')
depends=('git' 'aurutils')
backup=('etc/repotools.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cezarmathe/repotools/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('61C1AF95BB594AD40DEEB7103F8F89E56422CBA8')

package() {
	
  tar -xvf "${pkgname}-${pkgver}.tar.gz"

  cd "${pkgname}-${pkgver}"

  install -Dm755 "repotools" "${pkgdir}/usr/bin/repotools"
  
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  script_files=("add_remove_packages.sh" 
                "build_environment.sh" 
                "build_packages.sh" 
                "cycle.sh" 
                "help_usage.sh" 
                "new_meta_package.sh" 
                "new_repository.sh" 
                "pacman_entries.sh" 
                "sync_repositories.sh" 
                "update_repositories.sh" 
                "utils.sh")

  for script_file in ${script_files[*]}
  do
    install -Dm 644 "modules/${script_file}" "${pkgdir}/usr/lib/${pkgname}/${script_file}"
  done

  install -Dm644 "repotools.conf" "${pkgdir}/etc/${pkgname}.conf"
}
