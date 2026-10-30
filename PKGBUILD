# Maintainer: @ivanquanta

#---- usage info -----------------------------------------------------------------------------
IFS= read -r -d '' _usage << 'EOF'

    # USAGE:
    #    quick tip: copy/paste all this green block to terminal and run it as sudo user.

    # after install package, you can enable it in two steps

    # step 1. system integration (run once, copy/paste block)
    sudo cp -n /etc/skel/.bashrc{,.default.bak}
    sudo cp -n /etc/bash.bashrc{,.default.bak}
    sudo sed -i '/PS1.*/s/^#*/#/' /etc/skel/.bashrc /root/.bashrc > /dev/null 2>&1
    echo '# --- my addon ----------------------------' | sudo tee -a /etc/bash.bashrc
    echo 'source /usr/share/gentoo-color-bash/10-gentoo-color.bash 2>/dev/null' | sudo tee -a /etc/bash.bashrc

    # step 2. for every exist user after login run once (copy/paste block)
    cp -n ~/.bashrc{,.default.bak}
    sed -i '/PS1.*/s/^#*/#/' ~/.bashrc

    # Now you can add (if needed) you own ~/.dir_colors or /etc/DIR_COLORS for perfect ls.
    # See arch wiki or github for examples.
    #
EOF
#---------------------------------------------------------------------------------------------

pkgname=gentoo-color-bash # on 2025-05-04 size: 2190
pkgver=2026.10.31
#_id=b39e66dce51adbe2ccef98dbd7e321c6c2e6b835
pkgrel=1

pkgdesc='Gentoo color terminal and bash command prompt. Looks very nice.'
arch=('any')
url='https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gentoo-color-bash'
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
options=('!debug')
install=${pkgname}.install.sh

#source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash?id=${_id}")
source=("gentoo-color-bash-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc.d/10-gentoo-color-r2.bash")
sha256sums=('189766ac49f48880ce2507971fc3d8e15449976042d938bf6c6ad77e73793958')


echo -n "${_usage}" > /tmp/gentoo-color-bash_usage.txt

package() {

    install -D -m=644 ${pkgname}-${pkgver} "${pkgdir}/usr/share/${pkgname}/10-gentoo-color.bash"

}


