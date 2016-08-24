# Maintainer: Fabian(Tids) <plusfabi[AT+thegooglemailadress]>
pkgname=mhwd-addon-amdgpu-hwe
pkgver=20160823BETA
pkgrel=2
pkgdesc="Enables some extras for AMDGPU-open, and radeon(ati) stack, like OpenCL, VAAPI & VDPAU"
arch=('any')
url="https://forum.manjaro.org/t/amdgpu-improvements-for-manjaro"
license=('custom')
depends=('mhwd-db' 'linux47' 'grub')
source=('MHWDCONFIG_amdgpu-hwe' 'MHWDCONFIG_ati-hwe' 'amdgpu-hwe.ids')
md5sums=('698ddb6e0110c18713d25258a9247ccd'
         'e48adfb557dbd4babdb656a7c568b681'
         '475a1e63fd1bff0f203c159b6825ef3d')


package() {
    cd "${srcdir}"
    # Create Directories we need
    mkdir -p "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-amdgpu-hwe"
    mkdir -p "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-ati-hwe"
    mkdir -p "${pkgdir}/var/lib/mhwd/ids/pci"
    
    # Install AMDGPU config file
    install -D -m644 "${srcdir}/MHWDCONFIG_amdgpu-hwe" \
    "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-amdgpu-hwe/MHWDCONFIG"
    
    # Install PCI-ID file for AMDGPU Cards
    mkdir -p "${pkgdir}/var/lib/mhwd/ids/pci"
    install -D -m644 "${srcdir}/amdgpu-hwe.ids" \
    "${pkgdir}/var/lib/mhwd/ids/pci/amdgpu-hwe.ids"
    
    # Install ATI(radeon) config file
    install -D -m644 "${srcdir}/MHWDCONFIG_ati-hwe" \
    "${pkgdir}/var/lib/mhwd/db/pci/graphic_drivers/xf86-video-ati-hwe/MHWDCONFIG"
    # Note
    # We dont need a PCI-ID file for ati, since we use 
    # the file from mhwd without modifications    
}
