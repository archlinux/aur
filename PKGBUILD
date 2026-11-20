# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's catalog of font sets, and the fonts those sets name, as
# dependencies on Arch's own font packages. A font set (a frit, a .vtfrit
# file) lists the fonts that vtium draws a console with, in order, and adds
# layers (.vtlayer files) that bring in the fonts for a script, for icons
# or for emoji. The package installs no font itself. The font helper finds
# each font among the fonts installed on the machine, and leaves out a font
# the machine lacks.
#
# Each console package installs a few sets and layers of its own and lists
# vtium-fonts as an optional dependency. vtium-fonts installs the rest of
# the catalog beside them, and depends on the fonts that the console
# packages' sets name too.
#
# The sets come from a release tag of vtium, so the recipe is a release
# recipe: bump-release moves its _tag with the other release recipes. The
# maintainer signs the tag with the PGP key in validpgpkeys, and makepkg
# checks the tag's signature before it builds. Import the key once:
# gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
#
# The dependencies, and the sets and layers that draw with each one:
#
#   - kbd: the console fonts default8x16, sun12x22, cp865-8x16 and
#     cp865-8x8, which the console sets and the classic set sun-gallant
#     draw.
#   - terminus-font: the console font ter-i32b, which the console set
#     linux-ter-16x32 draws.
#   - adobe-source-code-pro-fonts, ttf-cascadia-code, ttf-dejavu,
#     ttf-fira-code, ttf-hack, ttf-ibm-plex and ttf-monoid: Source Code Pro,
#     Cascadia Code, DejaVu Sans Mono, Fira Code, Hack, IBM Plex Mono and
#     Monoid, which the code sets of the same names draw text with.
#   - ttf-jetbrains-mono: JetBrains Mono, which the set jetbrains-mono that
#     the console packages install draws text with.
#   - ttf-nerd-fonts-symbols-mono: Symbols Nerd Font Mono, the Powerline and
#     Nerd Fonts icons of the layers nerd-symbols and nerd-symbols-small.
#   - noto-fonts-emoji: Noto Color Emoji, the emoji of the layers noto-emoji
#     and noto-emoji-small.
#   - noto-fonts: Noto Sans Mono, which the script sets draw Latin text
#     with, and the Noto fonts of the layers arabic, hebrew, indic and
#     thai-lao.
#   - noto-fonts-cjk: Noto Sans CJK, whose SC, TC, JP and KR faces the four
#     CJK layers draw.
#
# The optional dependencies are the Nerd Fonts builds that the seven sets
# in the nerd folder draw text and icons with. Without its font, a Nerd
# Fonts set draws its text from Unifont and its icons as hollow boxes.
#
# Arch packages none of the fonts of three sets: Glass TTY VT220 for
# dec-vt220, Px437 IBM VGA 9x16 for ibm-vga and Tiny5 Mono for tiny5. Each
# set names the upstream page of its font in its url= line, so that a
# person can install the font from there.
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).
#
# References:
# - ADR-1204 D8: which fonts the package depends on, and why the Nerd Fonts
#   builds are optional.
# - ADR-1204 D9: vtium-fonts installs the catalog apart from the sets and
#   layers the console packages install.

pkgname=vtium-fonts
_tag=v0.1.0-alpha.10
pkgver=0.1.0alpha.10
pkgrel=1
pkgdesc='vtium font set catalog, and the fonts the vtium font sets name'
arch=('any')
url='https://github.com/vtium/vtium'
license=('MIT')
depends=('adobe-source-code-pro-fonts' 'kbd' 'noto-fonts' 'noto-fonts-cjk'
         'noto-fonts-emoji' 'terminus-font' 'ttf-cascadia-code' 'ttf-dejavu'
         'ttf-fira-code' 'ttf-hack' 'ttf-ibm-plex' 'ttf-jetbrains-mono'
         'ttf-monoid' 'ttf-nerd-fonts-symbols-mono')
optdepends=('ttf-cascadia-code-nerd: CaskaydiaCove Nerd Font Mono, for the set caskaydia-cove'
            'ttf-firacode-nerd: FiraCode Nerd Font Mono, for the set fira-code-nerd'
            'ttf-hack-nerd: Hack Nerd Font Mono, for the set hack-nerd'
            'ttf-jetbrains-mono-nerd: JetBrainsMono Nerd Font Mono, for the set jetbrains-mono-nerd'
            'ttf-monoid-nerd: Monoid Nerd Font Mono, for the set monoid-nerd'
            'ttf-sourcecodepro-nerd: SauceCodePro Nerd Font Mono, for the set sauce-code-pro'
            'ttf-terminus-nerd: Terminess Nerd Font Mono, for the set terminess')
makedepends=('git')
# The sets and layers that make install-fonts installs. pacman keeps a
# user's edits to these files when it upgrades the package.
backup=('etc/vtium/fonts/classic/dec-vt220.vtfrit'
        'etc/vtium/fonts/classic/ibm-vga.vtfrit'
        'etc/vtium/fonts/classic/sun-gallant.vtfrit'
        'etc/vtium/fonts/code/cascadia-code.vtfrit'
        'etc/vtium/fonts/code/dejavu-sans-mono.vtfrit'
        'etc/vtium/fonts/code/fira-code.vtfrit'
        'etc/vtium/fonts/code/hack.vtfrit'
        'etc/vtium/fonts/code/ibm-plex-mono.vtfrit'
        'etc/vtium/fonts/code/monoid.vtfrit'
        'etc/vtium/fonts/code/source-code-pro.vtfrit'
        'etc/vtium/fonts/console/default8x16.vtfrit'
        'etc/vtium/fonts/console/linux-sun-12x22.vtfrit'
        'etc/vtium/fonts/console/linux-sun-8x16.vtfrit'
        'etc/vtium/fonts/console/linux-ter-16x32.vtfrit'
        'etc/vtium/fonts/console/linux-vga-8x16.vtfrit'
        'etc/vtium/fonts/console/linux-vga-8x8.vtfrit'
        'etc/vtium/fonts/layers/arabic.vtlayer'
        'etc/vtium/fonts/layers/cjk-jp.vtlayer'
        'etc/vtium/fonts/layers/cjk-kr.vtlayer'
        'etc/vtium/fonts/layers/cjk-sc.vtlayer'
        'etc/vtium/fonts/layers/cjk-tc.vtlayer'
        'etc/vtium/fonts/layers/hebrew.vtlayer'
        'etc/vtium/fonts/layers/indic.vtlayer'
        'etc/vtium/fonts/layers/thai-lao.vtlayer'
        'etc/vtium/fonts/nerd/caskaydia-cove.vtfrit'
        'etc/vtium/fonts/nerd/fira-code-nerd.vtfrit'
        'etc/vtium/fonts/nerd/hack-nerd.vtfrit'
        'etc/vtium/fonts/nerd/jetbrains-mono-nerd.vtfrit'
        'etc/vtium/fonts/nerd/monoid-nerd.vtfrit'
        'etc/vtium/fonts/nerd/sauce-code-pro.vtfrit'
        'etc/vtium/fonts/nerd/terminess.vtfrit'
        'etc/vtium/fonts/scripts/noto-arabic.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-jp.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-kr.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-sc.vtfrit'
        'etc/vtium/fonts/scripts/noto-cjk-tc.vtfrit'
        'etc/vtium/fonts/scripts/noto-hebrew.vtfrit'
        'etc/vtium/fonts/scripts/noto-indic.vtfrit'
        'etc/vtium/fonts/scripts/noto-thai-lao.vtfrit'
        'etc/vtium/fonts/scripts/noto-vietnamese.vtfrit'
        'etc/vtium/fonts/small/tiny5.vtfrit')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

# make install-fonts installs the sets of the category folders classic,
# code, console, nerd, scripts and small in vtium's
# crates/vtium-config/frits into the folder of the same name under
# /etc/vtium/fonts, and the layers of its layers folder into
# /etc/vtium/fonts/layers. It leaves out every set and layer that a console
# package installs, so pacman can install vtium-fonts beside any console
# package without two packages owning one file. Which sets the package
# ships is therefore decided in vtium's tree. make install-fonts builds
# nothing, so the package needs no cargo. The sets stay in /etc whatever
# PREFIX is, because vtium reads its font sets from /etc/vtium/fonts.
# The recipe installs vtium's LICENSE and COPYING itself, since make
# install-fonts installs the sets and layers alone. COPYING holds the
# notices for the authors and the third-party code and data vtium builds
# in.
package() {
  make -C "$srcdir/vtium" PREFIX=/usr install-fonts DESTDIR="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/vtium/LICENSE" "$srcdir/vtium/COPYING"
}
