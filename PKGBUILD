# Maintainer: Gvol <gvol@nexusystems.org>
# https://github.com/Gvolexe/GvolTools

pkgname=gvoltools
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of SSH management and system administration tools"
arch=('any')
url="https://github.com/Gvolexe/GvolTools"
license=('MIT')
depends=(
    'python>=3.10'
    'python-paramiko'
    'python-cryptography'
)
optdepends=(
    'openssh: for SSH key management'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Gvolexe/GvolTools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/GvolTools-${pkgver}"
    
    # Install shared library
    install -Dm644 tools/gvcore/files/gvcore.py "${pkgdir}/usr/lib/gvtools/gvcore.py"
    
    # Install main binaries
    for tool_dir in tools/*/; do
        tool_name=$(basename "$tool_dir")
        
        # Skip gvcore (it's a library, not a CLI tool)
        [[ "$tool_name" == "gvcore" ]] && continue
        
        main_file="${tool_dir}files/${tool_name}.py"
        if [[ -f "$main_file" ]]; then
            install -Dm755 "$main_file" "${pkgdir}/usr/bin/${tool_name}"
        fi
    done
    
    # Create aliases via symlinks
    cd "${pkgdir}/usr/bin"
    
    # gv aliases
    ln -sf gv gvtools
    
    # gvfleet aliases
    ln -sf gvfleet fleet
    ln -sf gvfleet gvf
    ln -sf gvfleet f
    
    # gvsshprofile aliases
    ln -sf gvsshprofile sp
    ln -sf gvsshprofile gvsp
    
    # gvolkeymanager aliases
    ln -sf gvolkeymanager km
    ln -sf gvolkeymanager gvkm
    
    # gvhostbootstrap aliases
    ln -sf gvhostbootstrap hb
    ln -sf gvhostbootstrap gvhb
    
    # gvsshaudit aliases
    ln -sf gvsshaudit sshaudit
    ln -sf gvsshaudit gvsa
    
    # gvknownhostsctl aliases
    ln -sf gvknownhostsctl kh
    ln -sf gvknownhostsctl gvkh
    
    # gvsecretsync aliases
    ln -sf gvsecretsync ss
    ln -sf gvsecretsync gvss
    
    # gvcertctl aliases
    ln -sf gvcertctl cert
    ln -sf gvcertctl gvcert
    
    # gvfirewallctl aliases
    ln -sf gvfirewallctl fw
    ln -sf gvfirewallctl gvfw
    
    # gvupdates aliases
    ln -sf gvupdates updates
    ln -sf gvupdates gvup
    
    # gvsudoauth aliases
    ln -sf gvsudoauth sudo
    ln -sf gvsudoauth gvsudo
    
    # gvlogtriage aliases
    ln -sf gvlogtriage logs
    ln -sf gvlogtriage gvlogs
    
    # gvbackupctl aliases
    ln -sf gvbackupctl backup
    ln -sf gvbackupctl gvbak
    
    # gvdnscheck aliases
    ln -sf gvdnscheck dns
    ln -sf gvdnscheck gvdns
    
    # gvnetdiag aliases
    ln -sf gvnetdiag net
    ln -sf gvnetdiag gvnet
    
    # gvportsentry aliases
    ln -sf gvportsentry ports
    ln -sf gvportsentry gvports
    
    # gvdotctl aliases
    ln -sf gvdotctl dots
    ln -sf gvdotctl gvdots
    
    # gvgitopsinit aliases
    ln -sf gvgitopsinit gitops
    ln -sf gvgitopsinit gvgit
    
    # gvpermcheck aliases
    ln -sf gvpermcheck perms
    ln -sf gvpermcheck gvperms
    
    # Install license
    cd "${srcdir}/GvolTools-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
    
    # Install docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 OVERVIEW.md "${pkgdir}/usr/share/doc/${pkgname}/OVERVIEW.md" 2>/dev/null || true
}
